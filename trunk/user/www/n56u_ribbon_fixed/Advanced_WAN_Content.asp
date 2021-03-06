﻿<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta HTTP-EQUIV="Pragma" CONTENT="no-cache">
<meta HTTP-EQUIV="Expires" CONTENT="-1">
<link rel="shortcut icon" href="images/favicon.ico">
<link rel="icon" href="images/favicon.png">
<title>Wireless Router <#Web_Title#> - <#menu5_3_1#></title>
<link rel="stylesheet" type="text/css" href="/bootstrap/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/main.css">
<link rel="stylesheet" type="text/css" href="/bootstrap/css/engage.itoggle.css">

<script type="text/javascript" src="/jquery.js"></script>
<script type="text/javascript" src="/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/bootstrap/js/engage.itoggle.min.js"></script>
<script type="text/javascript" src="/state.js"></script>
<script type="text/javascript" src="/general.js"></script>
<script type="text/javascript" src="/popup.js"></script>
<script type="text/javascript" src="/help.js"></script>
<script type="text/javascript" src="/detect.js"></script>

<script>
    var $j = jQuery.noConflict();

    $j(document).ready(function() {
        $j('#wan_nat_x_on_of').iToggle({
            easing: 'linear',
            speed: 70,
            onClickOn: function(){
                $j("#wan_nat_x_fake").attr("checked", "checked").attr("value", 1);
                $j("#wan_nat_x_1").attr("checked", "checked");
                $j("#wan_nat_x_0").removeAttr("checked");
            },
            onClickOff: function(){
                $j("#wan_nat_x_fake").removeAttr("checked").attr("value", 0);
                $j("#wan_nat_x_0").attr("checked", "checked");
                $j("#wan_nat_x_1").removeAttr("checked");
            }
        });
        $j("#wan_nat_x_on_of label.itoggle").css("background-position", $j("input#wan_nat_x_fake:checked").length > 0 ? '0% -27px' : '100% -27px');

        $j('#gw_arp_ping_on_of').iToggle({
            easing: 'linear',
            speed: 70,
            onClickOn: function(){
                $j("#gw_arp_ping_fake").attr("checked", "checked").attr("value", 1);
                $j("#gw_arp_ping_1").attr("checked", "checked");
                $j("#gw_arp_ping_0").removeAttr("checked");
            },
            onClickOff: function(){
                $j("#gw_arp_ping_fake").removeAttr("checked").attr("value", 0);
                $j("#gw_arp_ping_0").attr("checked", "checked");
                $j("#gw_arp_ping_1").removeAttr("checked");
            }
        });
        $j("#gw_arp_ping_on_of label.itoggle").css("background-position", $j("input#gw_arp_ping_fake:checked").length > 0 ? '0% -27px' : '100% -27px');

        $j('#x_DHCPClient_on_of').iToggle({
            easing: 'linear',
            speed: 70,
            onClickOn: function(){
                $j("#x_DHCPClient_fake").attr("checked", "checked").attr("value", 1);
                $j("#x_DHCPClient_1").attr("checked", "checked");
                $j("#x_DHCPClient_0").removeAttr("checked");
                change_wan_dhcp_enable(0);
            },
            onClickOff: function(){
                $j("#x_DHCPClient_fake").removeAttr("checked").attr("value", 0);
                $j("#x_DHCPClient_0").attr("checked", "checked");
                $j("#x_DHCPClient_1").removeAttr("checked");
                change_wan_dhcp_enable(0);
            }
        });
        $j("#x_DHCPClient_on_of label.itoggle").css("background-position", $j("input#x_DHCPClient_fake:checked").length > 0 ? '0% -27px' : '100% -27px');

        $j('#wan_dnsenable_x_on_of').iToggle({
            easing: 'linear',
            speed: 70,
            onClickOn: function(){
                $j("#wan_dnsenable_x_fake").attr("checked", "checked").attr("value", 1);
                $j("#wan_dnsenable_x_1").attr("checked", "checked");
                $j("#wan_dnsenable_x_0").removeAttr("checked");
                change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', 1);
            },
            onClickOff: function(){
                $j("#wan_dnsenable_x_fake").removeAttr("checked").attr("value", 0);
                $j("#wan_dnsenable_x_0").attr("checked", "checked");
                $j("#wan_dnsenable_x_1").removeAttr("checked");
                change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', 0);
            }
        });
        $j("#wan_dnsenable_x_on_of label.itoggle").css("background-position", $j("input#wan_dnsenable_x_fake:checked").length > 0 ? '0% -27px' : '100% -27px');

        $j('#wan_pppoe_lcpa_on_of').iToggle({
            easing: 'linear',
            speed: 70,
            onClickOn: function(){
                $j("#wan_pppoe_lcpa_fake").attr("checked", "checked").attr("value", 1);
                $j("#wan_pppoe_lcpa_1").attr("checked", "checked");
                $j("#wan_pppoe_lcpa_0").removeAttr("checked");
            },
            onClickOff: function(){
                $j("#wan_pppoe_lcpa_fake").removeAttr("checked").attr("value", 0);
                $j("#wan_pppoe_lcpa_0").attr("checked", "checked");
                $j("#wan_pppoe_lcpa_1").removeAttr("checked");
            }
        });
        $j("#wan_pppoe_lcpa_on_of label.itoggle").css("background-position", $j("input#wan_pppoe_lcpa_fake:checked").length > 0 ? '0% -27px' : '100% -27px');

        $j('#vlan_filter_on_of').iToggle({
            easing: 'linear',
            speed: 70,
            onClickOn: function(){
                $j("#vlan_filter_fake").attr("checked", "checked").attr("value", 1);
                $j("#vlan_filter_1").attr("checked", "checked");
                $j("#vlan_filter_0").removeAttr("checked");
                change_stb_port_and_vlan();
            },
            onClickOff: function(){
                $j("#vlan_filter_fake").removeAttr("checked").attr("value", 0);
                $j("#vlan_filter_0").attr("checked", "checked");
                $j("#vlan_filter_1").removeAttr("checked");
                change_stb_port_and_vlan();
            }
        });
        $j("#vlan_filter_on_of label.itoggle").css("background-position", $j("input#vlan_filter_fake:checked").length > 0 ? '0% -27px' : '100% -27px');
    });

</script>

<script>

<% login_state_hook(); %>

<% kernel_caps_hook(); %>

var original_wan_type = wan_proto;
var original_wan_dhcpenable = parseInt('<% nvram_get_x("Layer3Forwarding", "x_DHCPClient"); %>');
var original_dnsenable = parseInt('<% nvram_get_x("IPConnection", "wan_dnsenable_x"); %>');
var client_mac = login_mac_str();
var original_wan_src_phy = '<% nvram_get_x("", "wan_src_phy"); %>';

function initial(){
	show_banner(1);
	show_menu(5,4,1);
	show_footer();

	enable_auto_hint(7, 19);

	change_wan_type(document.form.wan_proto.value, 0);
	fixed_change_wan_type(document.form.wan_proto.value);

	AuthSelection(document.form.wan_auth_mode.value);

	change_stb_port_and_vlan();
}

function applyRule(){
	if(validForm()){
		showLoading();
		
		inputCtrl(document.form.x_DHCPClient[0], 1);
		inputCtrl(document.form.x_DHCPClient[1], 1);
		if(!document.form.x_DHCPClient[0].checked){
			inputCtrl(document.form.wan_ipaddr, 1);
			inputCtrl(document.form.wan_netmask, 1);
			inputCtrl(document.form.wan_gateway, 1);
		}
		
		inputCtrl(document.form.wan_dnsenable_x[0], 1);
		inputCtrl(document.form.wan_dnsenable_x[1], 1);
		if(!document.form.wan_dnsenable_x[0].checked){
			inputCtrl(document.form.wan_dns1_x, 1);
			inputCtrl(document.form.wan_dns2_x, 1);
		}
		
		document.form.next_page.value = "";
		document.form.action_mode.value = " Apply ";
		document.form.submit();
	}
}

function validForm(){
	var wan_proto = document.form.wan_proto.value;
	var wan_stb_x = document.form.wan_stb_x.value;
	var min_vlan = support_min_vlan();
	
	if(!document.form.x_DHCPClient[0].checked){
		if(!validate_ipaddr_final(document.form.wan_ipaddr, 'wan_ipaddr')
				|| !validate_ipaddr_final(document.form.wan_netmask, 'wan_netmask')
				|| !validate_ipaddr_final(document.form.wan_gateway, 'wan_gateway')
				)
			return false;
		
		if(document.form.wan_gateway.value == document.form.wan_ipaddr.value){
			alert("<#IPConnection_warning_WANIPEQUALGatewayIP#>");
			document.form.wan_gateway.select();
			document.form.wan_gateway.focus();
			return false;
		}

		if(!wan_netmask_check(document.form.wan_netmask))
			return false;
	}
	
	if(!document.form.wan_dnsenable_x[0].checked){
		if(!validate_ipaddr_final(document.form.wan_dns1_x, 'wan_dns1_x')){
			document.form.wan_dns1_x.select();
			document.form.wan_dns1_x.focus();
			
			return false;
		}
		if(!validate_ipaddr_final(document.form.wan_dns2_x, 'wan_dns2_x')){
			document.form.wan_dns2_x.select();
			document.form.wan_dns2_x.focus();
			
			return false;
		}
	}
	
	if(wan_proto == "pppoe" || wan_proto == "pptp" || wan_proto == "l2tp"){
		if(!validate_string(document.form.wan_pppoe_username)
				|| !validate_string(document.form.wan_pppoe_passwd))
			return false;
	}
	
	if(wan_proto == "pppoe"){
		if(!validate_range(document.form.wan_pppoe_mtu, 1000, 1492)
				|| !validate_range(document.form.wan_pppoe_mru, 1000, 1492))
			return false;
		
		if(!validate_string(document.form.wan_pppoe_service)
				|| !validate_string(document.form.wan_pppoe_ac))
			return false;
		
		if(!validate_range(document.form.wan_pppoe_idletime, 0, 4294967295))
			return false;
	}
	else if(wan_proto == "pptp"){
		if(!validate_range(document.form.wan_pppoe_mtu, 1000, 1476)
				|| !validate_range(document.form.wan_pppoe_mru, 1000, 1476))
			return false;
	}
	else if(wan_proto == "l2tp"){
		if(!validate_range(document.form.wan_pppoe_mtu, 1000, 1460)
				|| !validate_range(document.form.wan_pppoe_mru, 1000, 1460))
			return false;
	}
	
	if(document.form.wan_hostname.value.length > 0)
		 if(!validate_string(document.form.wan_hostname))
		 	return false;
	
	if(document.form.wan_hwaddr_x.value.length > 0)
		 if(!validate_hwaddr(document.form.wan_hwaddr_x))
		 	return false;
	
	if(document.form.wan_heartbeat_x.value.length > 0)
		 if(!validate_string(document.form.wan_heartbeat_x))
		 	return false;

	if(document.form.vlan_filter[0].checked)
	{
		if(document.form.vlan_vid_cpu.value.length > 0)
		{
			if(!validate_range(document.form.vlan_vid_cpu, min_vlan, 4094))
				return false;
			if(!validate_range(document.form.vlan_pri_cpu, 0, 7))
				return false;
		}
		
		if(document.form.vlan_vid_iptv.value.length > 0)
		{
			if(!validate_range(document.form.vlan_vid_iptv, min_vlan, 4094))
				return false;
			if(!validate_range(document.form.vlan_pri_iptv, 0, 7))
				return false;
		}
		
		if (wan_stb_x == "1" || wan_stb_x == "6" || wan_stb_x == "7")
		{
			if(document.form.vlan_vid_lan1.value.length > 0)
			{
				if(!validate_range(document.form.vlan_vid_lan1, min_vlan, 4094))
					return false;
				if(!validate_range(document.form.vlan_pri_lan1, 0, 7))
					return false;
			}
		}
		
		if (wan_stb_x == "2" || wan_stb_x == "6" || wan_stb_x == "7")
		{
			if(document.form.vlan_vid_lan2.value.length > 0)
			{
				if(!validate_range(document.form.vlan_vid_lan2, min_vlan, 4094))
					return false;
				if(!validate_range(document.form.vlan_pri_lan2, 0, 7))
					return false;
			}
		}
		
		if (wan_stb_x == "3" || wan_stb_x == "5" || wan_stb_x == "7")
		{
			if(document.form.vlan_vid_lan3.value.length > 0)
			{
				if(!validate_range(document.form.vlan_vid_lan3, min_vlan, 4094))
					return false;
				if(!validate_range(document.form.vlan_pri_lan3, 0, 7))
					return false;
			}
		}
		
		if (wan_stb_x == "4" || wan_stb_x == "5")
		{
			if(document.form.vlan_vid_lan4.value.length > 0)
			{
				if(!validate_range(document.form.vlan_vid_lan4, min_vlan, 4094))
					return false;
				if(!validate_range(document.form.vlan_pri_lan4, 0, 7))
					return false;
			}
		}
	}
	
	return true;
}

function done_validating(action){
	refreshpage();
}

function change_wan_type(wan_type, flag){
	if(typeof(flag) != "undefined")
		change_wan_dhcp_enable(flag);
	else
		change_wan_dhcp_enable(1);

	if(wan_type == "pppoe"){
		inputCtrl(document.form.wan_dnsenable_x[0], 1);
		inputCtrl(document.form.wan_dnsenable_x[1], 1);
		$j('input[name="wan_dnsenable_x"]').removeAttr('disabled');
		$j('#wan_dnsenable_x_on_of').iClickable(1);
		
		inputCtrl(document.form.wan_pppoe_username, 1);
		inputCtrl(document.form.wan_pppoe_passwd, 1);
		inputCtrl(document.form.wan_pppoe_idletime, 1);
		inputCtrl(document.form.wan_heartbeat_x, 0);
		inputCtrl(document.form.wan_auth_mode, 0);
		inputCtrl(document.form.wan_auth_user, 0);
		inputCtrl(document.form.wan_auth_pass, 0);
		
		// 2008.03 James. patch for Oleg's patch. {
		inputCtrl(document.form.wan_pptp_options_x, 0);
		// 2008.03 James. patch for Oleg's patch. }
		
		$("dhcp_sect_desc").innerHTML = "<#WAN_MAN_desc#>";
		$("dhcp_auto_desc").innerHTML = "<#WAN_MAN_DHCP#>";
		
		$("hint_mtu").innerHTML = "[1000..1492]";
		$("hint_mru").innerHTML = "[1000..1492]";
		
		if (parseInt(document.form.wan_pppoe_mtu.value) > 1492)
			document.form.wan_pppoe_mtu.value = "1492";
		if (parseInt(document.form.wan_pppoe_mru.value) > 1492)
			document.form.wan_pppoe_mru.value = "1492";
		
		if (document.form.pppoe_dhcp_route.value == "1")
			$("dhcp_sect").style.display = "";
		else
			$("dhcp_sect").style.display = "none";
		
		$("wan_poller_row").style.display = "none";
		$("row_dhcp_toggle").style.display = "";
		$("row_dns_toggle").style.display = "";
		$("account_sect").style.display = "";
		$("row_pppoe_svc").style.display = "";
		$("row_pppoe_it").style.display = "";
		$("row_pppoe_ac").style.display = "";
		$("row_l2tp_cli").style.display = "none";
		$("row_pptp_mppe").style.display = "none";
		$("row_pppoe_dhcp").style.display = "";
		$("row_auth_type").style.display = "none";
	}
	else if(wan_type == "pptp"){
		inputCtrl(document.form.wan_dnsenable_x[0], 1);
		inputCtrl(document.form.wan_dnsenable_x[1], 1);
		$j('input[name="wan_dnsenable_x"]').removeAttr('disabled');
		$j('#wan_dnsenable_x_on_of').iClickable(1);
		
		inputCtrl(document.form.wan_pppoe_username, 1);
		inputCtrl(document.form.wan_pppoe_passwd, 1);
		inputCtrl(document.form.wan_pppoe_idletime, 0);
		inputCtrl(document.form.wan_heartbeat_x, 1);
		inputCtrl(document.form.wan_auth_mode, 0);
		inputCtrl(document.form.wan_auth_user, 0);
		inputCtrl(document.form.wan_auth_pass, 0);
		
		// 2008.03 James. patch for Oleg's patch. {
		inputCtrl(document.form.wan_pptp_options_x, 1);
		// 2008.03 James. patch for Oleg's patch. }
		
		$("dhcp_sect_desc").innerHTML = "<#WAN_MAN_desc#>";
		$("dhcp_auto_desc").innerHTML = "<#WAN_MAN_DHCP#>";
		
		$("hint_mtu").innerHTML = "[1000..1476]";
		$("hint_mru").innerHTML = "[1000..1476]";
		
		if (parseInt(document.form.wan_pppoe_mtu.value) > 1476)
			document.form.wan_pppoe_mtu.value = "1476";
		if (parseInt(document.form.wan_pppoe_mru.value) > 1476)
			document.form.wan_pppoe_mru.value = "1476";
		
		$("wan_poller_row").style.display = "none";
		$("dhcp_sect").style.display = "";
		$("row_dhcp_toggle").style.display = "";
		$("row_dns_toggle").style.display = "";
		$("account_sect").style.display = "";
		$("row_pppoe_svc").style.display = "none";
		$("row_pppoe_it").style.display = "none";
		$("row_pppoe_ac").style.display = "none";
		$("row_l2tp_cli").style.display = "none";
		$("row_pptp_mppe").style.display = "";
		$("row_pppoe_dhcp").style.display = "none";
		$("row_auth_type").style.display = "none";
	}
	else if(wan_type == "l2tp"){
		inputCtrl(document.form.wan_dnsenable_x[0], 1);
		inputCtrl(document.form.wan_dnsenable_x[1], 1);
		$j('input[name="wan_dnsenable_x"]').removeAttr('disabled');
		$j('#wan_dnsenable_x_on_of').iClickable(1);
		
		inputCtrl(document.form.wan_pppoe_username, 1);
		inputCtrl(document.form.wan_pppoe_passwd, 1);
		inputCtrl(document.form.wan_pppoe_idletime, 0);
		inputCtrl(document.form.wan_heartbeat_x, 1);
		inputCtrl(document.form.wan_auth_mode, 0);
		inputCtrl(document.form.wan_auth_user, 0);
		inputCtrl(document.form.wan_auth_pass, 0);
		
		// 2008.03 James. patch for Oleg's patch. {
		inputCtrl(document.form.wan_pptp_options_x, 0);
		// 2008.03 James. patch for Oleg's patch. }
		
		$("dhcp_sect_desc").innerHTML = "<#WAN_MAN_desc#>";
		$("dhcp_auto_desc").innerHTML = "<#WAN_MAN_DHCP#>";
		
		$("hint_mtu").innerHTML = "[1000..1460]";
		$("hint_mru").innerHTML = "[1000..1460]";
		
		if (parseInt(document.form.wan_pppoe_mtu.value) > 1460)
			document.form.wan_pppoe_mtu.value = "1460";
		if (parseInt(document.form.wan_pppoe_mru.value) > 1460)
			document.form.wan_pppoe_mru.value = "1460";
		
		$("wan_poller_row").style.display = "none";
		$("dhcp_sect").style.display = "";
		$("row_dhcp_toggle").style.display = "";
		$("row_dns_toggle").style.display = "";
		$("account_sect").style.display = "";
		$("row_pppoe_svc").style.display = "none";
		$("row_pppoe_it").style.display = "none";
		$("row_pppoe_ac").style.display = "none";
		$("row_l2tp_cli").style.display = "";
		$("row_pptp_mppe").style.display = "none";
		$("row_pppoe_dhcp").style.display = "none";
		$("row_auth_type").style.display = "none";
	}
	else if(wan_type == "static"){
		inputCtrl(document.form.wan_dnsenable_x[0], 0);
		inputCtrl(document.form.wan_dnsenable_x[1], 0);
		$j('input[name="wan_dnsenable_x"]').attr('disabled','disabled');
		$j('#wan_dnsenable_x_on_of').iClickable(0);
		
		inputCtrl(document.form.wan_heartbeat_x, 1);
		inputCtrl(document.form.wan_auth_mode, 1);
		inputCtrl(document.form.wan_auth_user, 1);
		inputCtrl(document.form.wan_auth_pass, 1);
		
		$("dhcp_sect_desc").innerHTML = "<#IPConnection_ExternalIPAddress_sectionname#>";
		$("dhcp_auto_desc").innerHTML = "<#Layer3Forwarding_x_DHCPClient_itemname#>";
		
		$("wan_poller_row").style.display = "none";
		$("dhcp_sect").style.display = "";
		$("row_dhcp_toggle").style.display = "none";
		$("row_dns_toggle").style.display = "none";
		$("account_sect").style.display = "none";
		$("row_pppoe_dhcp").style.display = "none";
		$("row_auth_type").style.display = "";
	}
	else{	// Automatic IP
		inputCtrl(document.form.wan_dnsenable_x[0], 1);
		inputCtrl(document.form.wan_dnsenable_x[1], 1);
		$j('input[name="wan_dnsenable_x"]').removeAttr('disabled');
		$j('#wan_dnsenable_x_on_of').iClickable(1);
		
		$("dhcp_sect_desc").innerHTML = "<#IPConnection_ExternalIPAddress_sectionname#>";
		$("dhcp_auto_desc").innerHTML = "<#Layer3Forwarding_x_DHCPClient_itemname#>";
		
		inputCtrl(document.form.wan_heartbeat_x, 1);
		inputCtrl(document.form.wan_auth_mode, 1);
		inputCtrl(document.form.wan_auth_user, 1);
		inputCtrl(document.form.wan_auth_pass, 1);
		
		$("wan_poller_row").style.display = "";
		$("dhcp_sect").style.display = "none";
		$("row_dhcp_toggle").style.display = "none";
		$("row_dns_toggle").style.display = "";
		$("account_sect").style.display = "none";
		$("row_pppoe_dhcp").style.display = "none";
		$("row_auth_type").style.display = "";
	}
	
	AuthSelection(document.form.wan_auth_mode.value);
}

function fixed_change_wan_type(wan_type){
	var flag = false;
	
	if(!document.form.x_DHCPClient[0].checked){
		if(document.form.wan_ipaddr.value.length == 0)
			document.form.wan_ipaddr.focus();
		else if(document.form.wan_netmask.value.length == 0)
			document.form.wan_netmask.focus();
		else if(document.form.wan_gateway.value.length == 0)
			document.form.wan_gateway.focus();
		else
			flag = true;
	}
	else
		flag = true;
	
	if(wan_type == "pppoe" || wan_type == "pptp" || wan_type == "l2tp"){
		if(wan_type == original_wan_type){
			document.form.wan_dnsenable_x[0].checked = original_dnsenable;
			document.form.wan_dnsenable_x[1].checked = !original_dnsenable;
			$j('#wan_dnsenable_x_on_of').iState(original_dnsenable);
			
			change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', original_dnsenable);
			
			if(flag == true && document.form.wan_dns1_x.value.length == 0 && document.form.wan_dnsenable_x[1].checked == 1)
				document.form.wan_dns1_x.focus();
		}
		else{
			document.form.wan_dnsenable_x[0].checked = 1;
			document.form.wan_dnsenable_x[1].checked = 0;
			$j('#wan_dnsenable_x_on_of').iState(1);
			
			change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', 0);
			
			inputCtrl(document.form.wan_dns1_x, 0);
			inputCtrl(document.form.wan_dns2_x, 0);
		}
	}
	else if(wan_type == "static"){
		document.form.wan_dnsenable_x[0].checked = 0;
		document.form.wan_dnsenable_x[1].checked = 1;
		$j('#wan_dnsenable_x_on_of').iState(0);
		
		change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', 0);
		
		if(flag == true && document.form.wan_dns1_x.value.length == 0)
			document.form.wan_dns1_x.focus();
	}
	else{	// wan_type == "dhcp"
		
		if(wan_type == original_wan_type){
			document.form.wan_dnsenable_x[0].checked = original_dnsenable;
			document.form.wan_dnsenable_x[1].checked = !original_dnsenable;
			$j('#wan_dnsenable_x_on_of').iState(original_dnsenable);
			
			change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', original_dnsenable);
		}
		else{
			document.form.wan_dnsenable_x[0].checked = 1;
			document.form.wan_dnsenable_x[1].checked = 0;
			$j('#wan_dnsenable_x_on_of').iState(1);
			
			change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', 0);
			
			inputCtrl(document.form.wan_dns1_x, 0);
			inputCtrl(document.form.wan_dns2_x, 0);
		}
	}
	
	if((document.form.x_DHCPClient[0].checked) || (wan_type == "pppoe" || wan_type == "pptp" || wan_type == "l2tp")){
		inputCtrl(document.form.wan_dnsenable_x[0], 1);
		inputCtrl(document.form.wan_dnsenable_x[1], 1);
		$j('input[name="wan_dnsenable_x"]').removeAttr('disabled');
		$j('#wan_dnsenable_x_on_of').iClickable(1);
	}
	else{
		inputCtrl(document.form.wan_dnsenable_x[0], 0);
		inputCtrl(document.form.wan_dnsenable_x[1], 0);
		$j('input[name="wan_dnsenable_x"]').attr('disabled', 'disabled');
		$j('#wan_dnsenable_x_on_of').iClickable(0);
	}
}

function change_wan_dhcp_enable(flag){
	var wan_type = document.form.wan_proto.value;
	
	// 2008.03 James. patch for Oleg's patch. {
	if(wan_type == "pppoe" || wan_type == "pptp" || wan_type == "l2tp"){
		if(flag == 1){
			if(wan_type == original_wan_type){
				document.form.x_DHCPClient[0].checked = original_wan_dhcpenable;
				document.form.x_DHCPClient[1].checked = !original_wan_dhcpenable;
				$j('#x_DHCPClient_on_of').iState(original_wan_dhcpenable);
			}
			else{
				document.form.x_DHCPClient[0].checked = 1;
				document.form.x_DHCPClient[1].checked = 0;
				$j('#x_DHCPClient_on_of').iState(1);
			}
		}
		
		inputCtrl(document.form.x_DHCPClient[0], 1);
		inputCtrl(document.form.x_DHCPClient[1], 1);
		$j('input[name="x_DHCPClient"]').removeAttr('disabled');
		$j('#x_DHCPClient_on_of').iClickable(1);
		
		var wan_dhcpenable = document.form.x_DHCPClient[0].checked;
		
		inputCtrl(document.form.wan_ipaddr, !wan_dhcpenable);
		inputCtrl(document.form.wan_netmask, !wan_dhcpenable);
		inputCtrl(document.form.wan_gateway, !wan_dhcpenable);
	}
	else if(wan_type == "static"){
		document.form.x_DHCPClient[0].checked = 0;
		document.form.x_DHCPClient[1].checked = 1;
		
		inputCtrl(document.form.x_DHCPClient[0], 0);
		inputCtrl(document.form.x_DHCPClient[1], 0);
		$j('input[name="x_DHCPClient"]').attr('disabled','disabled');
		$j('#x_DHCPClient_on_of').iState(0).iClickable(0);
		
		inputCtrl(document.form.wan_ipaddr, 1);
		inputCtrl(document.form.wan_netmask, 1);
		inputCtrl(document.form.wan_gateway, 1);
	}
	else{	// wan_type == "dhcp"
		document.form.x_DHCPClient[0].checked = 1;
		document.form.x_DHCPClient[1].checked = 0;
		
		inputCtrl(document.form.x_DHCPClient[0], 0);
		inputCtrl(document.form.x_DHCPClient[1], 0);
		$j('input[name="x_DHCPClient"]').attr('disabled','disabled');
		$j('#x_DHCPClient_on_of').iState(1).iClickable(0);
		
		inputCtrl(document.form.wan_ipaddr, 0);
		inputCtrl(document.form.wan_netmask, 0);
		inputCtrl(document.form.wan_gateway, 0);
	}
	
	if((document.form.x_DHCPClient[0].checked) || (wan_type == "pppoe" || wan_type == "pptp" || wan_type == "l2tp")){
		inputCtrl(document.form.wan_dnsenable_x[0], 1);
		inputCtrl(document.form.wan_dnsenable_x[1], 1);
		$j('input[name="x_DHCPClient"]').removeAttr('disabled');
		$j('#x_DHCPClient_on_of').iClickable(1);
	}
	else{
		document.form.wan_dnsenable_x[0].checked = 0;
		document.form.wan_dnsenable_x[1].checked = 1;
		change_common_radio(document.form.wan_dnsenable_x, 'IPConnection', 'wan_dnsenable_x', 0);
		
		inputCtrl(document.form.wan_dnsenable_x[0], 0);
		inputCtrl(document.form.wan_dnsenable_x[1], 0);
		$j('input[name="x_DHCPClient"]').attr('disabled','disabled');
		$j('#x_DHCPClient_on_of').iState(0).iClickable(0);
	}
}

function change_pppoe_man(man_type){
	if(document.form.wan_proto.value == "pppoe"){
		if (man_type == "1")
			$("dhcp_sect").style.display = "";
		else
			$("dhcp_sect").style.display = "none";
	}
}

function change_stb_port_and_vlan(){
	var wan_stb_x   = document.form.wan_stb_x.value;
	var vlan_filter = document.form.vlan_filter[0].checked;
	
	free_options(document.form.wan_src_phy);
	add_option(document.form.wan_src_phy, "WAN", "0", 0);
	
	if(wan_stb_x == "0" || vlan_filter) {
		$("wan_stb_iso").style.display = "none";
	}
	else {
		$("wan_stb_iso").style.display = "";
	}
	
	if(wan_stb_x == "0") {
		$("wan_src_phy").style.display = "none";
		document.form.wan_src_phy.SelectedIndex = 0;
	}
	else {
		$("wan_src_phy").style.display = "";
	}
	
	if(!vlan_filter) {
		$("vlan_cpu").style.display = "none";
		$("vlan_iptv").style.display = "none";
		$("vlan_lan1").style.display = "none";
		$("vlan_lan2").style.display = "none";
		$("vlan_lan3").style.display = "none";
		$("vlan_lan4").style.display = "none";
	}
	
	if(wan_stb_x == "0") {
		if(vlan_filter) {
			$("vlan_cpu").style.display = "";
			$("vlan_iptv").style.display = "";
		}
		$("vlan_lan1").style.display = "none";
		$("vlan_lan2").style.display = "none";
		$("vlan_lan3").style.display = "none";
		$("vlan_lan4").style.display = "none";
	}
	else if(wan_stb_x == "1") {
		if(vlan_filter) {
			$("vlan_cpu").style.display = "";
			$("vlan_iptv").style.display = "";
			$("vlan_lan1").style.display = "";
		}
		$("vlan_lan2").style.display = "none";
		$("vlan_lan3").style.display = "none";
		$("vlan_lan4").style.display = "none";
		add_option(document.form.wan_src_phy, "LAN1", "1", (original_wan_src_phy == 1) ? 1 : 0);
	}
	else if(wan_stb_x == "2") {
		if(vlan_filter) {
			$("vlan_cpu").style.display = "";
			$("vlan_iptv").style.display = "";
			$("vlan_lan2").style.display = "";
		}
		$("vlan_lan1").style.display = "none";
		$("vlan_lan3").style.display = "none";
		$("vlan_lan4").style.display = "none";
		add_option(document.form.wan_src_phy, "LAN2", "2", (original_wan_src_phy == 2) ? 1 : 0);
	}
	else if(wan_stb_x == "3") {
		if(vlan_filter) {
			$("vlan_cpu").style.display = "";
			$("vlan_iptv").style.display = "";
			$("vlan_lan3").style.display = "";
		}
		$("vlan_lan1").style.display = "none";
		$("vlan_lan2").style.display = "none";
		$("vlan_lan4").style.display = "none";
		add_option(document.form.wan_src_phy, "LAN3", "3", (original_wan_src_phy == 3) ? 1 : 0);
	}
	else if(wan_stb_x == "4") {
		if(vlan_filter) {
			$("vlan_cpu").style.display = "";
			$("vlan_iptv").style.display = "";
			$("vlan_lan4").style.display = "";
		}
		$("vlan_lan1").style.display = "none";
		$("vlan_lan2").style.display = "none";
		$("vlan_lan3").style.display = "none";
		add_option(document.form.wan_src_phy, "LAN4", "4", (original_wan_src_phy == 4) ? 1 : 0);
	}
	else if(wan_stb_x == "5") {
		if(vlan_filter) {
			$("vlan_cpu").style.display = "";
			$("vlan_iptv").style.display = "";
			$("vlan_lan3").style.display = "";
			$("vlan_lan4").style.display = "";
		}
		$("vlan_lan1").style.display = "none";
		$("vlan_lan2").style.display = "none";
		add_option(document.form.wan_src_phy, "LAN3", "3", (original_wan_src_phy == 3) ? 1 : 0);
		add_option(document.form.wan_src_phy, "LAN4", "4", (original_wan_src_phy == 4) ? 1 : 0);
	}
	else if(wan_stb_x == "6") {
		if(vlan_filter) {
			$("vlan_cpu").style.display = "";
			$("vlan_iptv").style.display = "";
			$("vlan_lan1").style.display = "";
			$("vlan_lan2").style.display = "";
		}
		$("vlan_lan3").style.display = "none";
		$("vlan_lan4").style.display = "none";
		add_option(document.form.wan_src_phy, "LAN1", "1", (original_wan_src_phy == 1) ? 1 : 0);
		add_option(document.form.wan_src_phy, "LAN2", "2", (original_wan_src_phy == 2) ? 1 : 0);
	}
	else if(wan_stb_x == "7") {
		if(vlan_filter) {
			$("vlan_cpu").style.display = "";
			$("vlan_iptv").style.display = "";
			$("vlan_lan1").style.display = "";
			$("vlan_lan2").style.display = "";
			$("vlan_lan3").style.display = "";
		}
		$("vlan_lan4").style.display = "none";
		add_option(document.form.wan_src_phy, "LAN1", "1", (original_wan_src_phy == 1) ? 1 : 0);
		add_option(document.form.wan_src_phy, "LAN2", "2", (original_wan_src_phy == 2) ? 1 : 0);
		add_option(document.form.wan_src_phy, "LAN3", "3", (original_wan_src_phy == 3) ? 1 : 0);
	}
}

function click_untag_lan(lan_port) {
	if (lan_port == 1) {
		document.form.vlan_tag_lan1.value = (document.form.untag_lan1.checked) ? "0" : "1";
	}
	else if (lan_port == 2) {
		document.form.vlan_tag_lan2.value = (document.form.untag_lan2.checked) ? "0" : "1";
	}
	else if (lan_port == 3) {
		document.form.vlan_tag_lan3.value = (document.form.untag_lan3.checked) ? "0" : "1";
	}
	else if (lan_port == 4) {
		document.form.vlan_tag_lan4.value = (document.form.untag_lan4.checked) ? "0" : "1";
	}
}

function AuthSelection(auth){
	var wan_type = document.form.wan_proto.value;
	
	if(wan_type == "pppoe" || wan_type == "pptp" || wan_type == "l2tp"){
		$("row_auth_user").style.display = "none";
		$("row_auth_pass").style.display = "none";
		if (wan_type == "pppoe")
			$("row_heartbeat").style.display = "none";
		else
			$("row_heartbeat").style.display = "";
		return 0;
	}
	
	if (auth == "1"){
		$("row_heartbeat").style.display = "";
	}
	else{
		$("row_heartbeat").style.display = "none";
	}
	
	if (auth == "2"){
		$("row_auth_user").style.display = "";
	}
	else{
		$("row_auth_user").style.display = "none";
	}
	
	if (auth != "0"){
		$("row_auth_pass").style.display = "";
	}
	else{
		$("row_auth_pass").style.display = "none";
	}
}

function showMAC(){
	document.form.wan_hwaddr_x.value = simplyMAC(this.client_mac);
}

function simplyMAC(fullMAC){
	var ptr;
	var tempMAC;
	var pos1, pos2;
	
	ptr = fullMAC;
	tempMAC = "";
	pos1 = pos2 = 0;
	
	for(var i = 0; i < 5; ++i){
		pos2 = pos1+ptr.indexOf(":");
		
		tempMAC += fullMAC.substring(pos1, pos2);
		
		pos1 = pos2+1;
		ptr = fullMAC.substring(pos1);
	}
	
	tempMAC += fullMAC.substring(pos1);
	
	return tempMAC;
}


</script>

<style>
    .wlan_filter {width: 50px;}
</style>

</head>

<body onload="initial();" onunLoad="disable_auto_hint(7, 19);return unload_body();">
<script>
	if(sw_mode == 3){
		alert("<#page_not_support_mode_hint#>");
		location.href = "/as.asp";
	}
</script>

<div class="wrapper">
    <div class="container-fluid" style="padding-right: 0px">
        <div class="row-fluid">
            <div class="span3"><center><div id="logo"></div></center></div>
            <div class="span9" >
                <div id="TopBanner"></div>
            </div>
        </div>
    </div>

    <div id="Loading" class="popup_bg"></div>

    <iframe name="hidden_frame" id="hidden_frame" src="" width="0" height="0" frameborder="0"></iframe>

    <form method="post" name="form" id="ruleForm" action="/start_apply.htm" target="hidden_frame">
    <input type="hidden" name="productid" value="<% nvram_get_f("general.log", "productid"); %>">
    <input type="hidden" name="support_cdma" value="<% nvram_get_x("IPConnection", "support_cdma"); %>">
    <input type="hidden" name="current_page" value="Advanced_WAN_Content.asp">
    <input type="hidden" name="next_page" value="">
    <input type="hidden" name="next_host" value="">
    <input type="hidden" name="sid_list" value="Layer3Forwarding;LANHostConfig;IPConnection;PPPConnection;PrinterStatus;WLANConfig11b">
    <input type="hidden" name="group_id" value="">
    <input type="hidden" name="modified" value="0">
    <input type="hidden" name="action_mode" value="">
    <input type="hidden" name="first_time" value="">
    <input type="hidden" name="action_script" value="">
    <input type="hidden" name="preferred_lang" id="preferred_lang" value="<% nvram_get_x("LANGUAGE", "preferred_lang"); %>">
    <input type="hidden" name="firmver" value="<% nvram_get_x("",  "firmver"); %>">
    <input type="hidden" name="lan_ipaddr" value="<% nvram_get_x("LANHostConfig", "lan_ipaddr"); %>" />
    <input type="hidden" name="lan_netmask" value="<% nvram_get_x("LANHostConfig", "lan_netmask"); %>" />
    <input type="hidden" name="vlan_tag_lan1" value="<% nvram_get_x("Layer3Forwarding", "vlan_tag_lan1"); %>" />
    <input type="hidden" name="vlan_tag_lan2" value="<% nvram_get_x("Layer3Forwarding", "vlan_tag_lan2"); %>" />
    <input type="hidden" name="vlan_tag_lan3" value="<% nvram_get_x("Layer3Forwarding", "vlan_tag_lan3"); %>" />
    <input type="hidden" name="vlan_tag_lan4" value="<% nvram_get_x("Layer3Forwarding", "vlan_tag_lan4"); %>" />

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span3">
                <!--Sidebar content-->
                <!--=====Beginning of Main Menu=====-->
                <div class="well sidebar-nav side_nav" style="padding: 0px;">
                    <ul id="mainMenu" class="clearfix"></ul>
                    <ul class="clearfix">
                        <li>
                            <div id="subMenu" class="accordion"></div>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="span9">
                <!--Body content-->
                <div class="row-fluid">
                    <div class="span12">
                        <div class="box well grad_colour_dark_blue">
                            <h2 class="box_head round_top"><#menu5_3#> - <#menu5_3_1#></h2>
                            <div class="round_bottom">
                                <div class="row-fluid">
                                    <div id="tabMenu" class="submenuBlock"></div>
                                    <div class="alert alert-info" style="margin: 10px;"><#Layer3Forwarding_x_ConnectionType_sectiondesc#></div>

                                    <table width="100%" align="center" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th width="50%"><#Layer3Forwarding_x_ConnectionType_itemname#></th>
                                            <td align="left">
                                                <select class="input" name="wan_proto" onchange="change_wan_type(this.value);fixed_change_wan_type(this.value);">
                                                    <option value="static" <% nvram_match_x("Layer3Forwarding", "wan_proto", "static", "selected"); %>>IPoE: <#BOP_ctype_title5#></option>
                                                    <option value="dhcp" <% nvram_match_x("Layer3Forwarding", "wan_proto", "dhcp", "selected"); %>>IPoE: <#BOP_ctype_title1#></option>
                                                    <option value="pppoe" <% nvram_match_x("Layer3Forwarding", "wan_proto", "pppoe", "selected"); %>>PPPoE</option>
                                                    <option value="pptp" <% nvram_match_x("Layer3Forwarding", "wan_proto", "pptp", "selected"); %>>PPTP</option>
                                                    <option value="l2tp" <% nvram_match_x("Layer3Forwarding", "wan_proto", "l2tp", "selected"); %>>L2TP</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr id="row_pppoe_dhcp" style="display:none;">
                                            <th>PPPoE VPN + MAN:</th>
                                            <td>
                                                <select name="pppoe_dhcp_route" class="input" onchange="change_pppoe_man(this.value);">
                                                    <option value="0" <% nvram_match_x("PPPConnection", "pppoe_dhcp_route", "0", "selected"); %>><#checkbox_No#></option>
                                                    <option value="1" <% nvram_match_x("PPPConnection", "pppoe_dhcp_route", "1", "selected"); %>>DHCP or Static</option>
                                                    <option value="2" <% nvram_match_x("PPPConnection", "pppoe_dhcp_route", "2", "selected"); %>>ZeroConf (169.254.*.*)</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><#Enable_NAT#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="wan_nat_x_on_of">
                                                        <input type="checkbox" id="wan_nat_x_fake" <% nvram_match_x("IPConnection", "wan_nat_x", "1", "value=1 checked"); %><% nvram_match_x("IPConnection", "wan_nat_x", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="wan_nat_x" id="wan_nat_x_1" class="input" value="1" <% nvram_match_x("IPConnection", "wan_nat_x", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="wan_nat_x" id="wan_nat_x_0" class="input" value="0" <% nvram_match_x("IPConnection", "wan_nat_x", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="hw_nat_row">
                                            <th><#HardwareNAT#></th>
                                            <td>
                                                <select name="hw_nat_mode" class="input">
                                                    <option value="0" <% nvram_match_x("IPConnection", "hw_nat_mode", "0", "selected"); %>>Offload TCP for LAN</option>
                                                    <option value="1" <% nvram_match_x("IPConnection", "hw_nat_mode", "1", "selected"); %>>Offload TCP for LAN/WLAN</option>
                                                    <option value="3" <% nvram_match_x("IPConnection", "hw_nat_mode", "3", "selected"); %>>Offload TCP/UDP for LAN</option>
                                                    <option value="4" <% nvram_match_x("IPConnection", "hw_nat_mode", "4", "selected"); %>>Offload TCP/UDP for LAN/WLAN</option>
                                                    <option value="2" <% nvram_match_x("IPConnection", "hw_nat_mode", "2", "selected"); %>>Disable (Slow)</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><#Enable_IGD_UPnP#></th>
                                            <td>
                                                <select name="upnp_enable" class="input">
                                                    <option value="0" <% nvram_match_x("LANHostConfig","upnp_enable", "0", "selected"); %>><#checkbox_No#></option>
                                                    <option value="1" <% nvram_match_x("LANHostConfig","upnp_enable", "1", "selected"); %>>UPnP</option>
                                                    <option value="2" <% nvram_match_x("LANHostConfig","upnp_enable", "2", "selected"); %>>UPnP/NAT-PMP</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr id="wan_poller_row">
                                            <th><#WAN_Poller#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="gw_arp_ping_on_of">
                                                        <input type="checkbox" id="gw_arp_ping_fake" <% nvram_match_x("IPConnection", "gw_arp_ping", "1", "value=1 checked"); %><% nvram_match_x("IPConnection", "gw_arp_ping", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="gw_arp_ping" id="gw_arp_ping_1" value="1" <% nvram_match_x("IPConnection", "gw_arp_ping", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="gw_arp_ping" id="gw_arp_ping_0" value="0" <% nvram_match_x("IPConnection", "gw_arp_ping", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" align="center" cellpadding="4" cellspacing="0" class="table" id="dhcp_sect">
                                        <tr>
                                            <th id="dhcp_sect_desc" colspan="2" style="background-color: #E3E3E3;"><#IPConnection_ExternalIPAddress_sectionname#></th>
                                        </tr>
                                        <tr id="row_dhcp_toggle">
                                            <th id="dhcp_auto_desc" width="50%"><#Layer3Forwarding_x_DHCPClient_itemname#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="x_DHCPClient_on_of">
                                                        <input type="checkbox" id="x_DHCPClient_fake" <% nvram_match_x("Layer3Forwarding", "x_DHCPClient", "1", "value=1 checked"); %><% nvram_match_x("Layer3Forwarding", "x_DHCPClient", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="x_DHCPClient" id="x_DHCPClient_1" class="input" value="1" onclick="change_wan_dhcp_enable(0);" <% nvram_match_x("Layer3Forwarding", "x_DHCPClient", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="x_DHCPClient" id="x_DHCPClient_0" class="input" value="0" onclick="change_wan_dhcp_enable(0);" <% nvram_match_x("Layer3Forwarding", "x_DHCPClient", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="50%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,1);"><#IPConnection_ExternalIPAddress_itemname#></a></th>
                                            <td><input type="text" name="wan_ipaddr" maxlength="15" class="input" size="15" value="<% nvram_get_x("IPConnection","wan_ipaddr"); %>" onKeyPress="return is_ipaddr(this);" onKeyUp="change_ipaddr(this);"/></td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,2);"><#IPConnection_x_ExternalSubnetMask_itemname#></a></th>
                                            <td><input type="text" name="wan_netmask" maxlength="15" class="input" size="15" value="<% nvram_get_x("IPConnection","wan_netmask"); %>" onKeyPress="return is_ipaddr(this);" onKeyUp="change_ipaddr(this);"/></td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,3);"><#IPConnection_x_ExternalGateway_itemname#></a></th>
                                            <td><input type="text" name="wan_gateway" maxlength="15" class="input" size="15" value="<% nvram_get_x("IPConnection","wan_gateway"); %>" onKeyPress="return is_ipaddr(this);" onKeyUp="change_ipaddr(this);"/></td>
                                        </tr>
                                    </table>

                                    <table width="100%" align="center" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#IPConnection_x_DNSServerEnable_sectionname#></th>
                                        </tr>
                                        <tr id="row_dns_toggle">
                                            <th width="50%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,12);"><#IPConnection_x_DNSServerEnable_itemname#></a></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="wan_dnsenable_x_on_of">
                                                        <input type="checkbox" id="wan_dnsenable_x_fake" <% nvram_match_x("IPConnection", "wan_dnsenable_x", "1", "value=1 checked"); %><% nvram_match_x("IPConnection", "wan_dnsenable_x", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="wan_dnsenable_x" id="wan_dnsenable_x_1" value="1" onclick="return change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', 1)" <% nvram_match_x("IPConnection", "wan_dnsenable_x", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="wan_dnsenable_x" id="wan_dnsenable_x_0" value="0" onclick="return change_common_radio(this, 'IPConnection', 'wan_dnsenable_x', 0)" <% nvram_match_x("IPConnection", "wan_dnsenable_x", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th width="50%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,13);"><#IPConnection_x_DNSServer1_itemname#></a></th>
                                            <td>
                                              <input type="text" maxlength="15" class="input" size="15" name="wan_dns1_x" value="<% nvram_get_x("IPConnection","wan_dns1_x"); %>" onkeypress="return is_ipaddr(this)" onkeyup="change_ipaddr(this)"/>
                                              </td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,14);"><#IPConnection_x_DNSServer2_itemname#></a></th>
                                            <td>
                                               <input type="text" maxlength="15" class="input" size="15" name="wan_dns2_x" value="<% nvram_get_x("IPConnection","wan_dns2_x"); %>" onkeypress="return is_ipaddr(this)" onkeyup="change_ipaddr(this)"/>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" align="center" cellpadding="4" cellspacing="0" class="table" id="account_sect">
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#PPPConnection_UserName_sectionname#></th>
                                        </tr>
                                        <tr>
                                            <th width="50%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,4);"><#PPPConnection_UserName_itemname#></a></th>
                                            <td>
                                               <input type="text" maxlength="64" class="input" size="32" name="wan_pppoe_username" value="<% nvram_get_x("PPPConnection","wan_pppoe_username"); %>" onkeypress="return is_string(this)"/>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,5);"><#PPPConnection_Password_itemname#></a></th>
                                            <td>
                                                <div class="input-append">
                                                    <input type="password" maxlength="64" class="input" size="32" name="wan_pppoe_passwd" id="wan_pppoe_passwd" style="width: 175px;" value="<% nvram_get_x("PPPConnection","wan_pppoe_passwd"); %>"/>
                                                    <button style="margin-left: -5px;" class="btn" type="button" onclick="passwordShowHide('wan_pppoe_passwd')"><i class="icon-eye-close"></i></button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><#PopTopAuth#></th>
                                            <td>
                                                <select name="wan_pppoe_auth" class="input">
                                                    <option value="0" <% nvram_match_x("", "wan_pppoe_auth", "0","selected"); %>>Auto</option>
                                                    <option value="1" <% nvram_match_x("", "wan_pppoe_auth", "1","selected"); %>>PAP</option>
                                                    <option value="2" <% nvram_match_x("", "wan_pppoe_auth", "2","selected"); %>>CHAP</option>
                                                    <option value="3" <% nvram_match_x("", "wan_pppoe_auth", "3","selected"); %>>MS-CHAPv2</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr id="row_pppoe_it" style="display:none">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,6);"><#PPPConnection_IdleDisconnectTime_itemname#></a></th>
                                            <td>
                                                <input type="text" maxlength="10" class="input" size="32" name="wan_pppoe_idletime" value="<% nvram_get_x("PPPConnection","wan_pppoe_idletime"); %>" onkeypress="return is_number(this)"/>
                                            </td>
                                        </tr>
                                        <tr id="row_l2tp_cli">
                                            <th><#PPP_L2TPD#></th>
                                            <td>
                                                <select name="wan_l2tpd" class="input">
                                                    <option value="0" <% nvram_match_x("","wan_l2tpd", "0","selected"); %>>xL2TPD</option>
                                                    <option value="1" <% nvram_match_x("","wan_l2tpd", "1","selected"); %>>RP-L2TP</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,7);"><#PPPConnection_x_PPPoEMTU_itemname#></a></th>
                                            <td>
                                                <input type="text" maxlength="5" size="5" name="wan_pppoe_mtu" class="input" value="<% nvram_get_x("PPPConnection", "wan_pppoe_mtu"); %>" onkeypress="return is_number(this)"/>
                                               &nbsp;<span id="hint_mtu" style="color:#888;"></span>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,8);"><#PPPConnection_x_PPPoEMRU_itemname#></a></th>
                                            <td>
                                               <input type="text" maxlength="5" size="5" name="wan_pppoe_mru" class="input" value="<% nvram_get_x("PPPConnection", "wan_pppoe_mru"); %>" onkeypress="return is_number(this)"/>
                                               &nbsp;<span id="hint_mru" style="color:#888;"></span>
                                            </td>
                                        </tr>
                                        <tr id="row_pppoe_svc">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,9);"><#PPPConnection_x_ServiceName_itemname#></a></th>
                                            <td>
                                                <input type="text" maxlength="32" class="input" size="32" name="wan_pppoe_service" value="<% nvram_get_x("PPPConnection","wan_pppoe_service"); %>" onkeypress="return is_string(this)"/>
                                            </td>
                                        </tr>
                                        <tr id="row_pppoe_ac">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,10);"><#PPPConnection_x_AccessConcentrator_itemname#></a></th>
                                            <td>
                                                <input type="text" maxlength="32" class="input" size="32" name="wan_pppoe_ac" value="<% nvram_get_x("PPPConnection","wan_pppoe_ac"); %>" onkeypress="return is_string(this)"/>
                                            </td>
                                        </tr>
                                        <tr id="row_pptp_mppe">
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,17);"><#PPPConnection_x_PPTPOptions_itemname#></a></th>
                                            <td>
                                                <select name="wan_pptp_options_x" class="input">
                                                    <option value="" <% nvram_match_x("Layer3Forwarding","wan_pptp_options_x", "","selected"); %>>Auto</option>
                                                    <option value="nomppe" <% nvram_match_x("Layer3Forwarding","wan_pptp_options_x", "nomppe","selected"); %>>No Encryption/Compression</option>
                                                    <option value="+mppe-40" <% nvram_match_x("Layer3Forwarding","wan_pptp_options_x", "+mppe-40","selected"); %>>Encryption MPPE 40 Bit</option>
                                                    <option value="+mppe-128" <% nvram_match_x("Layer3Forwarding","wan_pptp_options_x", "+mppe-128","selected"); %>>Encryption MPPE 128 Bit</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><#PPP_AdaptiveLCP#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="wan_pppoe_lcpa_on_of">
                                                        <input type="checkbox" id="wan_pppoe_lcpa_fake" <% nvram_match_x("PPPConnection", "wan_pppoe_lcpa", "1", "value=1 checked"); %><% nvram_match_x("PPPConnection", "wan_pppoe_lcpa", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="wan_pppoe_lcpa" id="wan_pppoe_lcpa_1" value="1" <% nvram_match_x("PPPConnection", "wan_pppoe_lcpa", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="wan_pppoe_lcpa" id="wan_pppoe_lcpa_0" value="0" <% nvram_match_x("PPPConnection", "wan_pppoe_lcpa", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,18);"><#PPPConnection_x_AdditionalOptions_itemname#></a></th>
                                            <td>
                                                <input type="text" name="wan_pppoe_options_x" value="<% nvram_get_x("PPPConnection", "wan_pppoe_options_x"); %>" class="input" maxlength="255" size="32" onKeyPress="return is_string(this)" onBlur="validate_string(this)"/>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#PPPConnection_x_HostNameForISP_sectionname#></th>
                                        </tr>
                                        <tr id="row_auth_type">
                                            <th width="50%"><#ISP_Authentication_mode#></th>
                                            <td>
                                                <select name="wan_auth_mode" class="input" onChange="AuthSelection(this.value)">
                                                    <option value="0" <% nvram_match_x("Layer3Forwarding", "wan_auth_mode", "0", "selected"); %>><#checkbox_No#></option>
                                                    <option value="1" <% nvram_match_x("Layer3Forwarding", "wan_auth_mode", "1", "selected"); %>>ISP KABiNET</option>
                                                    <option value="2" <% nvram_match_x("Layer3Forwarding", "wan_auth_mode", "2", "selected"); %>>802.1x EAPoL-MD5</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr id="row_auth_user">
                                            <th width="50%"><#ISP_Authentication_user#></th>
                                            <td>
                                                <input type="text" maxlength="64" class="input" size="32" name="wan_auth_user" value="<% nvram_get_x("Layer3Forwarding","wan_auth_user"); %>" onKeyPress="return is_string(this)"/>
                                            </td>
                                        </tr>
                                        <tr id="row_auth_pass">
                                            <th width="50%"><#ISP_Authentication_pass#></th>
                                            <td>
                                                <div class="input-append">
                                                    <input type="password" maxlength="64" class="input" size="32" name="wan_auth_pass" id="wan_auth_pass" style="width: 175px;" value="<% nvram_get_x("Layer3Forwarding","wan_auth_pass"); %>" onKeyPress="return is_string(this)"/>
                                                    <button style="margin-left: -5px;" class="btn" type="button" onclick="passwordShowHide('wan_auth_pass')"><i class="icon-eye-close"></i></button>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="row_heartbeat">
                                            <th width="50%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,19);"><#PPPConnection_x_HeartBeat_itemname#></a></th>
                                            <td>
                                                <input type="text" name="wan_heartbeat_x" class="input" maxlength="256" size="32" value="<% nvram_get_x("PPPConnection","wan_heartbeat_x"); %>" onKeyPress="return is_string(this)"/>
                                            </td>
                                        </tr>
                                        <tr id="hostname_x">
                                            <th width="50%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,15);"><#PPPConnection_x_HostNameForISP_itemname#></a></th>
                                            <td>
                                                <input type="text" name="wan_hostname" class="input" maxlength="32" size="32" value="<% nvram_get_x("PPPConnection","wan_hostname"); %>" onkeypress="return is_string(this)"/>
                                            </td>
                                        </tr>
                                        <tr id="clone_mac_x">
                                            <th width="50%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,16);"><#PPPConnection_x_MacAddressForISP_itemname#></a></th>
                                            <td>
                                                <input type="text" name="wan_hwaddr_x" class="input" style="float: left; margin-right: 5px;" maxlength="12" size="15" value="<% nvram_get_x("PPPConnection","wan_hwaddr_x"); %>" onKeyPress="return is_hwaddr()"/>
                                                <button type="button" class="btn" onclick="showMAC();"><i class="icon icon-plus"></i></button>
                                            </td>
                                        </tr>
                                    </table>

                                    <table width="100%" cellpadding="4" cellspacing="0" class="table">
                                        <tr>
                                            <th colspan="2" style="background-color: #E3E3E3;"><#WAN_Bridge#></th>
                                        </tr>
                                        <tr>
                                            <th width="50%"><a class="help_tooltip" href="javascript:void(0);" onmouseover="openTooltip(this,7,21);"><#Layer3Forwarding_x_STB_itemname#></a></th>
                                            <td>
                                                <select name="wan_stb_x" class="input" onChange="change_stb_port_and_vlan();">
                                                    <option value="0" <% nvram_match_x("Layer3Forwarding", "wan_stb_x", "0", "selected"); %>><#checkbox_No#></option>
                                                    <option value="1" <% nvram_match_x("Layer3Forwarding", "wan_stb_x", "1", "selected"); %>>LAN1</option>
                                                    <option value="2" <% nvram_match_x("Layer3Forwarding", "wan_stb_x", "2", "selected"); %>>LAN2</option>
                                                    <option value="3" <% nvram_match_x("Layer3Forwarding", "wan_stb_x", "3", "selected"); %>>LAN3</option>
                                                    <option value="4" <% nvram_match_x("Layer3Forwarding", "wan_stb_x", "4", "selected"); %>>LAN4</option>
                                                    <option value="5" <% nvram_match_x("Layer3Forwarding", "wan_stb_x", "5", "selected"); %>>LAN3 & LAN4</option>
                                                    <option value="6" <% nvram_match_x("Layer3Forwarding", "wan_stb_x", "6", "selected"); %>>LAN1 & LAN2</option>
                                                    <option value="7" <% nvram_match_x("Layer3Forwarding", "wan_stb_x", "7", "selected"); %>>LAN1 & LAN2 & LAN3</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr id="wan_src_phy">
                                            <th><#WAN_Source#></th>
                                            <td>
                                                <select name="wan_src_phy" class="input">
                                                </select>
                                            </td>
                                        </tr>
                                        <tr id="wan_stb_iso">
                                            <th><#STB_Isolation#></th>
                                            <td>
                                                <select name="wan_stb_iso" class="input">
                                                    <option value="0" <% nvram_match_x("Layer3Forwarding", "wan_stb_iso", "0", "selected"); %>><#checkbox_No#></option>
                                                    <option value="1" <% nvram_match_x("Layer3Forwarding", "wan_stb_iso", "1", "selected"); %>><#STB_IsolationItem1#></option>
                                                    <option value="2" <% nvram_match_x("Layer3Forwarding", "wan_stb_iso", "2", "selected"); %>><#STB_IsolationItem2#></option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th><#WAN_FilterVLAN#></th>
                                            <td>
                                                <div class="main_itoggle">
                                                    <div id="vlan_filter_on_of">
                                                        <input type="checkbox" id="vlan_filter_fake" <% nvram_match_x("Layer3Forwarding", "vlan_filter", "1", "value=1 checked"); %><% nvram_match_x("Layer3Forwarding", "vlan_filter", "0", "value=0"); %>>
                                                    </div>
                                                </div>

                                                <div style="position: absolute; margin-left: -10000px;">
                                                    <input type="radio" name="vlan_filter" id="vlan_filter_1" value="1" onClick="change_stb_port_and_vlan();" <% nvram_match_x("Layer3Forwarding", "vlan_filter", "1", "checked"); %>/><#checkbox_Yes#>
                                                    <input type="radio" name="vlan_filter" id="vlan_filter_0" value="0" onClick="change_stb_port_and_vlan();" <% nvram_match_x("Layer3Forwarding", "vlan_filter", "0", "checked"); %>/><#checkbox_No#>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr id="vlan_cpu">
                                            <th>VLAN CPU (Internet):</th>
                                            <td>
                                                <span class="input-prepend"><span class="add-on">VID</span><input type="text" name="vlan_vid_cpu" class="wlan_filter" size="4" maxlength="4" value="<% nvram_get_x("Layer3Forwarding", "vlan_vid_cpu"); %>"/>&nbsp;&nbsp;</span>
                                                <span class="input-prepend"><span class="add-on">PRIO</span><input type="text" name="vlan_pri_cpu" class="wlan_filter" size="2" maxlength="1" value="<% nvram_get_x("Layer3Forwarding", "vlan_pri_cpu"); %>"/></span>
                                            </td>
                                        </tr>
                                        <tr id="vlan_iptv">
                                            <th>VLAN CPU (IPTV):</th>
                                            <td>
                                                <span class="input-prepend"><span class="add-on">VID</span><input type="text" name="vlan_vid_iptv" class="wlan_filter" size="4" maxlength="4" value="<% nvram_get_x("Layer3Forwarding", "vlan_vid_iptv"); %>"/>&nbsp;&nbsp;</span>
                                                <span class="input-prepend"><span class="add-on">PRIO</span><input type="text" name="vlan_pri_iptv" class="wlan_filter" size="2" maxlength="1" value="<% nvram_get_x("Layer3Forwarding", "vlan_pri_iptv"); %>"/></span>
                                            </td>
                                        </tr>
                                        <tr id="vlan_lan1">
                                            <th>VLAN LAN1:</th>
                                            <td>
                                                <span class="input-prepend"><span class="add-on">VID</span><input type="text" name="vlan_vid_lan1" class="wlan_filter" size="4" maxlength="4" value="<% nvram_get_x("Layer3Forwarding", "vlan_vid_lan1"); %>"/>&nbsp;&nbsp;</span>
                                                <span class="input-prepend"><span class="add-on">PRIO</span><input type="text" name="vlan_pri_lan1" class="wlan_filter" size="2" maxlength="1" value="<% nvram_get_x("Layer3Forwarding", "vlan_pri_lan1"); %>"/>&nbsp;&nbsp;</span>
                                                <label class="checkbox inline"><input type="checkbox" name="untag_lan1" value="" style="margin-left:10;" onclick="click_untag_lan(1);" <% nvram_match_x("Layer3Forwarding", "vlan_tag_lan1", "0", "checked"); %>/><#UntagVLAN#></label>
                                            </td>
                                        </tr>
                                        <tr id="vlan_lan2">
                                            <th>VLAN LAN2:</th>
                                            <td>
                                                <span class="input-prepend"><span class="add-on">VID</span><input type="text" name="vlan_vid_lan2" class="wlan_filter" size="4" maxlength="4" value="<% nvram_get_x("Layer3Forwarding", "vlan_vid_lan2"); %>"/>&nbsp;&nbsp;</span>
                                                <span class="input-prepend"><span class="add-on">PRIO</span><input type="text" name="vlan_pri_lan2" class="wlan_filter" size="2" maxlength="1" value="<% nvram_get_x("Layer3Forwarding", "vlan_pri_lan2"); %>"/>&nbsp;&nbsp;</span>
                                                <label class="checkbox inline"><input type="checkbox" name="untag_lan2" value="" style="margin-left:10;" onclick="click_untag_lan(2);" <% nvram_match_x("Layer3Forwarding", "vlan_tag_lan2", "0", "checked"); %>/><#UntagVLAN#></label>
                                            </td>
                                        </tr>
                                        <tr id="vlan_lan3">
                                            <th>VLAN LAN3:</th>
                                            <td>
                                                <span class="input-prepend"><span class="add-on">VID</span><input type="text" name="vlan_vid_lan3" class="wlan_filter" size="4" maxlength="4" value="<% nvram_get_x("Layer3Forwarding", "vlan_vid_lan3"); %>"/>&nbsp;&nbsp;</span>
                                                <span class="input-prepend"><span class="add-on">PRIO</span><input type="text" name="vlan_pri_lan3" class="wlan_filter" size="2" maxlength="1" value="<% nvram_get_x("Layer3Forwarding", "vlan_pri_lan3"); %>"/>&nbsp;&nbsp;</span>
                                                <label class="checkbox inline"><input type="checkbox" name="untag_lan3" value="" style="margin-left:10;" onclick="click_untag_lan(3);" <% nvram_match_x("Layer3Forwarding", "vlan_tag_lan3", "0", "checked"); %>/><#UntagVLAN#></label>
                                            </td>
                                        </tr>
                                        <tr id="vlan_lan4">
                                            <th>VLAN LAN4:</th>
                                            <td>
                                                <span class="input-prepend"><span class="add-on">VID</span><input type="text" name="vlan_vid_lan4" class="wlan_filter" size="4" maxlength="4" value="<% nvram_get_x("Layer3Forwarding", "vlan_vid_lan4"); %>"/>&nbsp;&nbsp;</span>
                                                <span class="input-prepend"><span class="add-on">PRIO</span><input type="text" name="vlan_pri_lan4" class="wlan_filter" size="2" maxlength="1" value="<% nvram_get_x("Layer3Forwarding", "vlan_pri_lan4"); %>"/>&nbsp;&nbsp;</span>
                                                <label class="checkbox inline"><input type="checkbox" name="untag_lan4" value="" style="margin-left:10;" onclick="click_untag_lan(4);" <% nvram_match_x("Layer3Forwarding", "vlan_tag_lan4", "0", "checked"); %>/><#UntagVLAN#></label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="border-top: 0 none;">
                                                <br/>
                                                <center><input class="btn btn-primary" style="width: 219px" type="button" value="<#CTL_apply#>" onclick="applyRule()" /></center>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    </form>

    <!--==============Beginning of hint content=============-->
    <div id="help_td" style="position: absolute; margin-left: -10000px" valign="top">
        <form name="hint_form"></form>
        <div id="helpicon" onClick="openHint(0,0);"><img src="images/help.gif" /></div>

        <div id="hintofPM" style="display:none;">
            <table width="100%" cellpadding="0" cellspacing="1" class="Help" bgcolor="#999999">
            <thead>
                <tr>
                    <td>
                        <div id="helpname" class="AiHintTitle"></div>
                        <a href="javascript:;" onclick="closeHint()" ><img src="images/button-close.gif" class="closebutton" /></a>
                    </td>
                </tr>
            </thead>

                <tr>
                    <td valign="top" >
                        <div class="hint_body2" id="hint_body"></div>
                        <iframe id="statusframe" name="statusframe" class="statusframe" src="" frameborder="0"></iframe>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <!--==============Ending of hint content=============-->

    <div id="footer"></div>
</div>
</body>
</html>
