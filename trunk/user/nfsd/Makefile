SRC_NAME1="nfs-utils-1.2.3"
SRC_NAME2="portmap_6.0"

CFLAGS += -ffunction-sections -fdata-sections
LDFLAGS += -Wl,--gc-sections

all:	config_test
	$(MAKE) -C $(SRC_NAME1)
	$(MAKE) -C $(SRC_NAME2) NO_TCP_WRAPPER=1 DAEMON_UID=99 DAEMON_GID=99

config_test:
	( if [ -f ./config_done ]; then \
		echo "the same configuration"; \
	else \
		make configure && touch config_done; \
	fi )

configure:
	( cd $(SRC_NAME1) && \
	knfsd_cv_bsd_signals=no \
	./configure \
		--prefix=/ \
		--disable-ipv6 \
		--disable-tirpc \
		--disable-mount \
		--disable-libmount \
		--disable-nfsv4 \
		--disable-nfsv41 \
		--disable-uuid \
		--disable-gss \
		--without-krb5 \
		--without-tcp-wrappers \
		--host=$(HOST_TARGET) \
		--build=$(HOST_BUILD) ; \
	)

clean:
	if [ -f $(SRC_NAME1)/Makefile ] ; then \
		$(MAKE) -C $(SRC_NAME1) distclean ; \
	fi; \
	$(MAKE) -C $(SRC_NAME2) clean
	rm -f portmap
	rm -f exportfs
	rm -f rpc.nfsd
	rm -f rpc.mountd
	rm -f config_done

romfs:
	cp $(SRC_NAME2)/portmap .
	cp $(SRC_NAME1)/utils/exportfs/exportfs .
	cp $(SRC_NAME1)/utils/nfsd/nfsd ./rpc.nfsd
	cp $(SRC_NAME1)/utils/mountd/mountd ./rpc.mountd
	$(STRIP) portmap
	$(STRIP) exportfs
	$(STRIP) rpc.nfsd
	$(STRIP) rpc.mountd
	$(ROMFSINST) /usr/bin/nfsd.sh
	$(ROMFSINST) /sbin/portmap
	$(ROMFSINST) /sbin/exportfs
	$(ROMFSINST) /sbin/rpc.nfsd
	$(ROMFSINST) /sbin/rpc.mountd

