/*
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License as
 * published by the Free Software Foundation; either version 2 of
 * the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston,
 * MA 02111-1307 USA
 */

#include <errno.h>
#include <stdio.h>
#include <signal.h>
#include <unistd.h>
#include <sys/types.h>
#include <shutils.h>
#include <nvram/bcmnvram.h>
#include <time.h>
#include <stdlib.h>
#include <sys/time.h>
#include <netinet/if_ether.h>
#include <net/if.h>
#include <net/if_arp.h>

#include "rc.h"

//#define DEBUG		1
#define MAX_ARP_WAIT	5
#define MAX_ARP_RETRY	3

struct arpMsg {
	/* Ethernet header */
	uint8_t  h_dest[6];			/* destination ether addr */
	uint8_t  h_source[6];			/* source ether addr */
	uint16_t h_proto;			/* packet type ID field */

	/* ARP packet */
	uint16_t htype;				/* hardware type (must be ARPHRD_ETHER) */
	uint16_t ptype;				/* protocol type (must be ETH_P_IP) */
	uint8_t  hlen;				/* hardware address length (must be 6) */
	uint8_t  plen;				/* protocol address length (must be 4) */
	uint16_t operation;			/* ARP opcode */
	uint8_t  sHaddr[6];			/* sender's hardware address */
	uint8_t  sInaddr[4];			/* sender's IP address */
	uint8_t  tHaddr[6];			/* target's hardware address */
	uint8_t  tInaddr[4];			/* target's IP address */
	uint8_t  pad[18];			/* pad for min. Ethernet payload (60 bytes) */
} ATTRIBUTE_PACKED;


void chk_udhcpc()
{
	char *gateway_str;
	in_addr_t gateway_ip;
	in_addr_t ip;

	if ( (nvram_match("wan_route_x", "IP_Routed") && nvram_match("wan0_proto", "dhcp")) ||
	      nvram_match("wan_route_x", "IP_Bridged"))
	{
		if (nvram_match("wan_route_x", "IP_Routed"))
		{
			gateway_str = nvram_safe_get("wan_gateway_t");
			ip = get_wan_ipaddr(1);
		}
		else
		{
			gateway_str = nvram_safe_get("lan_gateway_t");
			ip = get_lan_ipaddr();
		}
		
		gateway_ip = inet_addr_(gateway_str);
		
		if (gateway_ip == INADDR_ANY || ip == INADDR_ANY || !pids("udhcpc"))
		{
			return;
		}
		
		logmessage("detect_wan", "No response from gateway (%s)! Perform DHCP renew...", gateway_str);
		system("killall -SIGUSR1 udhcpc");
	}
}


int arpping_gateway(void)
{
	in_addr_t gateway_ip;
	in_addr_t ip;
	uint8_t mac[6];
	char wanmac[18];
	char tmp[3];
	char *ifname;
	int s, i, rv, rcv_bytes;
	struct sockaddr addr;
	struct ifreq ifr;
	struct arpMsg arp;
	struct timeval arp_timeout;
	long timeStart;
	const int one = 1;

	if (nvram_match("wan_route_x", "IP_Routed"))
	{
		gateway_ip = inet_addr_(nvram_safe_get("wan_gateway_t"));
		ip = get_wan_ipaddr(1);
		strcpy(wanmac, nvram_safe_get("wan0_hwaddr"));	// WAN MAC address
	}
	else
	{
		gateway_ip = inet_addr_(nvram_safe_get("lan_gateway_t"));
		ip = get_lan_ipaddr();
		strcpy(wanmac, nvram_safe_get("lan_hwaddr"));	// br0 MAC address
	}

	if (gateway_ip == INADDR_ANY || ip == INADDR_ANY || gateway_ip == ip)
	{
		return 1;
	}

	wanmac[17]=0;
	for(i=0; i<6; i++)
	{
		tmp[2]=0;
		strncpy(tmp, wanmac+i*3, 2);
		mac[i]=strtol(tmp, NULL, 16);
	}

	s = socket(PF_PACKET, SOCK_PACKET, htons(ETH_P_ARP));
	if (s < 0) {
		perror("socket:");
		return 0;
	}
	
	if (setsockopt(s, SOL_SOCKET, SO_BROADCAST, &one, sizeof(one)) < 0) {
		perror("setsockopt:");
		close(s);
		return 0;
	}

	/* send arp request */
	memset(&arp, 0, sizeof(arp));
	memset(arp.h_dest, 0xFF, 6);			/* MAC DA (Broadcast) */
	memcpy(arp.h_source, mac, 6);			/* MAC SA */
	arp.h_proto = htons(ETH_P_ARP);			/* protocol type (Ethernet) */
	arp.htype = htons(ARPHRD_ETHER);		/* hardware type */
	arp.ptype = htons(ETH_P_IP);			/* protocol type (ARP message) */
	arp.hlen = 6;					/* hardware address length */
	arp.plen = 4;					/* protocol address length */
	arp.operation = htons(ARPOP_REQUEST);		/* ARP op code */
	memcpy(arp.sInaddr, &ip, sizeof(ip));		/* source IP address */
	memcpy(arp.sHaddr, mac, 6);			/* source hardware address */
	memcpy(arp.tInaddr, &gateway_ip, sizeof(gateway_ip));	/* target IP address */

	memset(&addr, 0, sizeof(addr));
	memset(&ifr, 0, sizeof(ifr));
	if (nvram_match("wan_route_x", "IP_Routed"))
		ifname = get_man_ifname(0);
	else
		ifname = IFNAME_BR;

	strncpy(addr.sa_data, ifname, sizeof(addr.sa_data));
	strncpy(ifr.ifr_name, ifname, IFNAMSIZ);
	if (setsockopt(s, SOL_SOCKET, SO_BINDTODEVICE, (void *)&ifr, sizeof(ifr)) < 0)
	{
		perror("setsockopt:");
	}

	if (sendto(s, &arp, sizeof(arp), 0, &addr, sizeof(addr)) < 0)
	{
		close(s);
		
		perror("sendto:");
		
		sleep(1);
		return 0;
	}

	arp_timeout.tv_sec = 1;
	arp_timeout.tv_usec = 0;
	setsockopt(s, SOL_SOCKET, SO_RCVTIMEO, &arp_timeout, sizeof(arp_timeout));

	/* wait arp reply */
	rv = 0;
	timeStart = uptime();
	for(;;)
	{
		rcv_bytes = recvfrom(s, &arp, sizeof(arp), 0, NULL, NULL);
		if (rcv_bytes < 0 && errno != EINTR && errno != EAGAIN)
			break;
		
		if (rcv_bytes >= 42 &&
		    arp.h_proto == htons(ETH_P_ARP) &&
		    arp.operation == htons(ARPOP_REPLY) &&
		    memcmp(arp.tHaddr, mac, 6) == 0 &&
		    *((uint32_t *) arp.sInaddr) == gateway_ip) 
		{
#ifdef DEBUG
				fprintf(stderr, "Valid arp reply from [%02X:%02X:%02X:%02X:%02X:%02X]\n",
					(unsigned char)arp.sHaddr[0],
					(unsigned char)arp.sHaddr[1],
					(unsigned char)arp.sHaddr[2],
					(unsigned char)arp.sHaddr[3],
					(unsigned char)arp.sHaddr[4],
					(unsigned char)arp.sHaddr[5]);
#endif
			rv = 1;
			break;
		}
		
		if (uptime() - timeStart > MAX_ARP_WAIT)
			break;
	}
	
	close(s);

	return rv;
}

int has_phy_link(void)
{
	if (nvram_match("wan_route_x", "IP_Routed"))
	{
		if (nvram_match("link_wan", "1"))
			return 1;
		else
			return 0;
	}
	else
	{
		if (nvram_match("link_lan", "1"))
			return 1;
		else
			return 0;
	}
}

int poll_gateway(void)
{
	int count;

	for(;;)
	{
		count = 0;
		
		while (count < MAX_ARP_RETRY)
		{
			if (nvram_match("wan_route_x", "IP_Routed") && !has_phy_link())
			{
				count++;
				sleep(2);
			}
			else if (arpping_gateway())
			{
				break;
			}
			else
			{
#ifdef DEBUG
				fprintf(stderr, "[detect_wan] no response from gateway\n");
#endif
				count++;
			}
		}
		
		if (has_phy_link() && (count >= MAX_ARP_RETRY))
		{
			chk_udhcpc();
		}
		
		sleep(20);
	}
	
	return 0;
}

static void catch_sig_detect_wan(int sig)
{
	if (sig == SIGTERM)
	{
		remove("/var/run/detect_wan.pid");
		exit(0);
	}
}

int detect_wan_main(int argc, char *argv[])
{
	FILE *fp;

	signal(SIGPIPE, SIG_IGN);
	signal(SIGHUP,  SIG_IGN);
	signal(SIGUSR1, SIG_IGN);
	signal(SIGUSR2, SIG_IGN);
	signal(SIGTERM, catch_sig_detect_wan);

	if (daemon(0, 0) < 0) {
		perror("daemon");
		exit(errno);
	}

	/* write pid */
	if ((fp = fopen("/var/run/detect_wan.pid", "w")) != NULL)
	{
		fprintf(fp, "%d", getpid());
		fclose(fp);
	}

	return poll_gateway();
}

