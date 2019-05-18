include $(TOPDIR)/rules.mk

PKG_NAME:=rtl8822bs
PKG_RELEASE=1
# PKG_VERSION should same as package/kernel/mac80211/Makefile
PKG_VERSION:=4.19.32-1

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk


define KernelPackage/rtl8822bs
  SUBMENU:=Wireless Drivers
  TITLE:=Driver for Realtek RTL8822BS SDIO WIFI.
  DEPENDS:=+kmod-cfg80211 +kmod-mmc +@DRIVER_11N_SUPPORT +@DRIVER_11AC_SUPPORT @!LINUX_3_18 @!LINUX_4_9
  FILES:=\
	$(PKG_BUILD_DIR)/../backports-$(PKG_VERSION)/drivers/net/wireless/realtek/rtl8822bs/8822bs.ko
  AUTOLOAD:=$(call AutoProbe,8822bs)
  PROVIDES:=kmod-rtl8822bs
endef

define Build/Compile
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)/../backports-$(PKG_VERSION)" \
		$(KERNEL_MAKE_FLAGS) \
		KLIB_BUILD="$(LINUX_DIR)" \
		CPTCFG_RTL8822BS=m \
		modules
endef

$(eval $(call KernelPackage,rtl8822bs))
