ROMFS_DIR = $(ROOTDIR)/romfs

BOARD_PATTERN=s/ZVMODELVZ/$(CONFIG_FIRMWARE_PRODUCT_ID)/g
WEBUI_NAME=n56u_ribbon_fixed

all:

romfs:
	echo "Make www romfs"
	rm -Rf $(ROMFS_DIR)/www
	cp -R $(WEBUI_NAME) $(ROMFS_DIR)/www
	rm -f $(ROMFS_DIR)/www/httpd_check.htm
	echo "ASUSTeK" > $(ROMFS_DIR)/www/httpd_check.htm
	cd $(ROMFS_DIR)/www && ln -sf ../tmp/settings Settings.CFG && cd ../..
	cd $(ROMFS_DIR)/www && ln -sf ../tmp/settings Settings_RT-N56U.CFG && cd ../..
	cd $(ROMFS_DIR)/www && ln -sf /opt/share/www/custom custom
	
	cp dict/EN.header $(ROMFS_DIR)/www
	
	if [ "$(CONFIG_FIRMWARE_INCLUDE_LANG_BR)" = "y" ] ; then \
		echo "LANG_BR=Brazil" >> $(ROMFS_DIR)/www/EN.header ; \
		cp dict/BR.dict $(ROMFS_DIR)/www ; \
		sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/BR.dict ; \
	fi
	
	if [ "$(CONFIG_FIRMWARE_INCLUDE_LANG_CZ)" = "y" ] ; then \
		echo "LANG_CZ=Česky" >> $(ROMFS_DIR)/www/EN.header ; \
		cp dict/CZ.dict $(ROMFS_DIR)/www ; \
		sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/CZ.dict ; \
	fi
	
	if [ "$(CONFIG_FIRMWARE_INCLUDE_LANG_DA)" = "y" ] ; then \
		echo "LANG_DA=Dansk" >> $(ROMFS_DIR)/www/EN.header ; \
		cp dict/DA.dict $(ROMFS_DIR)/www ; \
		sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/DA.dict ; \
	fi
	
	if [ "$(CONFIG_FIRMWARE_INCLUDE_LANG_DE)" = "y" ] ; then \
		echo "LANG_DE=Deutsch" >> $(ROMFS_DIR)/www/EN.header ; \
		cp dict/DE.dict $(ROMFS_DIR)/www ; \
		sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/DE.dict ; \
	fi
	
	if [ "$(CONFIG_FIRMWARE_INCLUDE_LANG_ES)" = "y" ] ; then \
		echo "LANG_ES=Español" >> $(ROMFS_DIR)/www/EN.header ; \
		cp dict/ES.dict $(ROMFS_DIR)/www ; \
		sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/ES.dict ; \
	fi
	
	if [ "$(CONFIG_FIRMWARE_INCLUDE_LANG_FI)" = "y" ] ; then \
		echo "LANG_FI=Finsk" >> $(ROMFS_DIR)/www/EN.header ; \
		cp dict/FI.dict $(ROMFS_DIR)/www ; \
		sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/FI.dict ; \
	fi
	
	if [ "$(CONFIG_FIRMWARE_INCLUDE_LANG_FR)" = "y" ] ; then \
		echo "LANG_FR=Français" >> $(ROMFS_DIR)/www/EN.header ; \
		cp dict/FR.dict $(ROMFS_DIR)/www ; \
		sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/FR.dict ; \
	fi
	
	if [ "$(CONFIG_FIRMWARE_INCLUDE_LANG_NO)" = "y" ] ; then \
		echo "LANG_NO=Norsk" >> $(ROMFS_DIR)/www/EN.header ; \
		cp dict/NO.dict $(ROMFS_DIR)/www ; \
		sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/NO.dict ; \
	fi
	
	if [ "$(CONFIG_FIRMWARE_INCLUDE_LANG_PL)" = "y" ] ; then \
		echo "LANG_PL=Polski" >> $(ROMFS_DIR)/www/EN.header ; \
		cp dict/PL.dict $(ROMFS_DIR)/www ; \
		sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/PL.dict ; \
	fi
	
	if [ "$(CONFIG_FIRMWARE_INCLUDE_LANG_RU)" = "y" ] ; then \
		echo "LANG_RU=Pусский" >> $(ROMFS_DIR)/www/EN.header ; \
		cp dict/RU.dict $(ROMFS_DIR)/www ; \
		sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/RU.dict ; \
	fi
	
	if [ "$(CONFIG_FIRMWARE_INCLUDE_LANG_SV)" = "y" ] ; then \
		echo "LANG_SV=Svensk" >> $(ROMFS_DIR)/www/EN.header ; \
		cp dict/SV.dict $(ROMFS_DIR)/www ; \
		sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/SV.dict ; \
	fi
	
	cat $(ROMFS_DIR)/www/EN.header dict/EN.footer > $(ROMFS_DIR)/www/EN.dict
	rm -f $(ROMFS_DIR)/www/EN.header
	sed $(BOARD_PATTERN) -i $(ROMFS_DIR)/www/EN.dict
	
# remove unused resorces
	rm -f $(ROMFS_DIR)/www/upnp.asp
	rm -f $(ROMFS_DIR)/www/QoS_EZQoS.asp
	rm -f $(ROMFS_DIR)/www/EZQoS.asp
	rm -f $(ROMFS_DIR)/www/Advanced_QOSUserSpec_Content.asp
	rm -f $(ROMFS_DIR)/www/images/ill-*.gif
	rm -f $(ROMFS_DIR)/www/images/band-*.gif

clean:
