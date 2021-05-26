include $(TOPDIR)/rules.mk

PKG_NAME:=mt7603u-hk
PKG_RELEASE=1

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=

PKG_MAINTAINER:=
PKG_BUILD_PARALLEL:=1

PKG_SOURCE_URL:=https://github.com/ChalesYu/buildroot_platform_hardware_wifi_mtk_drivers_mt7603.git
PKG_MIRROR_HASH:=40d7e73ab35cd1b037f732b4aa5704d2fc7d39d76561c2b5bd78d7aeccde219c
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2021-05-26
PKG_SOURCE_VERSION:=8852f5067684a6854f424c1b4f2b829f4cb4bdc5

PKG_MAINTAINER:=ChalesYu <574249312@qq.com>
PKG_BUILD_PARALLEL:=1
#PKG_EXTMOD_SUBDIRS:=mt7603u-hk

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

define KernelPackage/mt7603u-hk
  SUBMENU:=Wireless Drivers
  TITLE:=Driver for  mt7603u wifi.
  DEPENDS:=+kmod-cfg80211 +kmod-usb-core +@DRIVER_11N_SUPPORT +mt7603u-hk-firmware
  FILES:=\
	$(PKG_BUILD_DIR)/mt7603usta.ko
  AUTOLOAD:=$(call AutoProbe,mt7603usta)
  PROVIDES:=kmod-mt7603u
endef

NOSTDINC_FLAGS := \
	$(KERNEL_NOSTDINC_FLAGS) \
	-I$(PKG_BUILD_DIR) \
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

PKG_MAKE_FLAGS += USER_MODULE_NAME=mt7603usta
PKG_MAKE_FLAGS += USER_DRV_NAME=mt7603usta
KERNEL_MAKE_FLAGS += CONFIG_MT7603U=m

define Build/Compile
	$(CP) $(PKG_BUILD_DIR)/Makefile.backports $(PKG_BUILD_DIR)/Makefile
	+$(MAKE) $(PKG_JOBS) -C "$(LINUX_DIR)" \
		$(KERNEL_MAKE_FLAGS) \
		$(PKG_MAKE_FLAGS) \
		M="$(PKG_BUILD_DIR)" \
		NOSTDINC_FLAGS="$(NOSTDINC_FLAGS)" \
		modules

endef

$(eval $(call KernelPackage,mt7603u-hk))
