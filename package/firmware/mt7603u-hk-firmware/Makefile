include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/version.mk

PKG_NAME:=mt7603u-hk-firmware
PKG_RELEASE:=1
PKG_FLAGS:=

include $(INCLUDE_DIR)/package.mk

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) $(PKG_BUILD_DIR)/../../../package/firmware/mt7603u-hk-firmware/MT7603USTA.dat $(PKG_BUILD_DIR)
endef

define Build/Compile
endef

define Package/mt7603u-hk-firmware
  SECTION:=firmware
  CATEGORY:=Firmware
  DEPENDS:=
  TITLE:=mt7603u-hk-firmware
endef

define Package/mt7603u-hk-firmware/install
	$(INSTALL_DIR) $(1)/etc/
	$(INSTALL_DIR) $(1)/etc/Wireless/
	$(INSTALL_DIR) $(1)/etc/Wireless/RT2870STA/
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/MT7603USTA.dat  $(1)/etc/Wireless/RT2870STA/MT7603USTA.dat

endef

$(eval $(call BuildPackage,mt7603u-hk-firmware))
