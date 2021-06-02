include $(TOPDIR)/rules.mk

PKG_NAME:=mt7668sn-kh
PKG_RELEASE=1

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=

PKG_MAINTAINER:=
PKG_BUILD_PARALLEL:=1

PKG_SOURCE_URL:=https://gitlab.com/ChalesYu/mt7668sn.git
PKG_MIRROR_HASH:=8111b02ccaaaf155d2132805cf566cd02d28d7617bb71e7b271eb95f43c7c289
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2021-06-02
PKG_SOURCE_VERSION:=d6be81de2b4c9e998ea8d977edcaa460679670ab

#PKG_MAINTAINER:=ChalesYu <574249312@qq.com>
PKG_BUILD_PARALLEL:=1
#PKG_EXTMOD_SUBDIRS:=mt7668sn-kh

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/mt7668sn-kh
  SUBMENU:=Wireless Drivers
  TITLE:=Driver for  mt7668 sdio wifi.
  DEPENDS:=+kmod-cfg80211 +@DRIVER_11N_SUPPORT +@DRIVER_11AC_SUPPORT
  FILES:=\
	$(PKG_BUILD_DIR)/wlan_mt76x8_sdio.ko
  AUTOLOAD:=$(call AutoProbe,wlan_mt76x8_sdio)
  PROVIDES:=kmod-mt7668sn-kh
endef

NOSTDINC_FLAGS := \
	$(KERNEL_NOSTDINC_FLAGS) \
	-I$(PKG_BUILD_DIR) \
	-I$(PKG_BUILD_DIR)/os \
	-I$(PKG_BUILD_DIR)/os/linux/include \
	-I$(PKG_BUILD_DIR)/include \
	-I$(PKG_BUILD_DIR)/include/nic \
	-I$(PKG_BUILD_DIR)/include/mgmt \
	-I$(PKG_BUILD_DIR)/include/chips \
	-I$(STAGING_DIR)/usr/include/mac80211-backport/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211-backport \
	-I$(STAGING_DIR)/usr/include/mac80211/uapi \
	-I$(STAGING_DIR)/usr/include/mac80211 \
	-include backport/autoconf.h \
	-include backport/backport.h

ifeq ($(CONFIG_BIG_ENDIAN), y)
NOSTDINC_FLAGS += -DCONFIG_BIG_ENDIAN
endif
ifeq ($(CONFIG_LITTLE_ENDIAN), y)
NOSTDINC_FLAGS += -DCONFIG_LITTLE_ENDIAN
endif

PKG_MAKE_FLAGS += USER_MODULE_NAME=wlan_mt76x8_sdio
PKG_MAKE_FLAGS += USER_DRV_NAME=wlan_mt76x8_sdio
KERNEL_MAKE_FLAGS += CONFIG_MT7668RSN=m

define Build/Compile
	cp -rpf $(PKG_BUILD_DIR)/drv_wlan/MT6632/wlan/* $(PKG_BUILD_DIR)/.
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
		$(KERNEL_MAKE_FLAGS) \
		$(PKG_MAKE_FLAGS) \
		M="$(PKG_BUILD_DIR)" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules

endef

$(eval $(call KernelPackage,mt7668sn-kh))
