include $(TOPDIR)/rules.mk

PKG_NAME:=rtl8822b-sdio-usb
PKG_RELEASE=1

PKG_LICENSE:=GPLv2
PKG_LICENSE_FILES:=

PKG_MAINTAINER:=
PKG_BUILD_PARALLEL:=1

PKG_SOURCE_URL:=https://github.com/ChalesYu/88x2bu.git
PKG_MIRROR_HASH:=4724b357b899e58ecf7c87712fb5da13a89151bf8f188770895e1d7243f920b9
PKG_SOURCE_PROTO:=git
PKG_SOURCE_DATE:=2021-06-02
PKG_SOURCE_VERSION:=8eb548f67ae6e071fa47ab58afa5b75801e7cdbf

PKG_MAINTAINER:=ChalesYu <574249312@qq.com>
PKG_BUILD_PARALLEL:=1
#PKG_EXTMOD_SUBDIRS:=rtl8822b-sdio-usb

STAMP_CONFIGURED_DEPENDS := $(STAGING_DIR)/usr/include/mac80211-backport/backport/autoconf.h

include $(INCLUDE_DIR)/kernel.mk
include $(INCLUDE_DIR)/package.mk

### This MUST same as PKG_VERSION in package/kernel/mac80211/Makefile
#BACKPORTS_VER:=5.10.34-1
BACKPORTS_VER:= \
	$(shell grep -m 1 PKG_VERSION $(TOPDIR)/package/kernel/mac80211/Makefile | sed 's/PKG_VERSION:=//g' )

define KernelPackage/rtl8822b-sdio-usb
  SUBMENU:=Wireless Drivers
  TITLE:=Driver for rtl8822bs and rtl8822bu wifi.
  DEPENDS:=+kmod-cfg80211 +@DRIVER_11N_SUPPORT +@DRIVER_11AC_SUPPORT
  FILES:=\
	$(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/rtl8822b-sdio/88x2bs.ko \
	$(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/rtl8822b-usb/88x2bu.ko
  AUTOLOAD:=$(call AutoProbe,88x2bs 88x2bu)
  PROVIDES:=kmod-rtl8822b-sdio-usb
endef

KERNEL_MAKE_FLAGS += CONFIG_RTL8822BU=m

MAKE_OPTS:= -C "$(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)" \
	$(KERNEL_MAKE_FLAGS) \
	EXTRA_CFLAGS="-I$(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/include $(IREMAP_CFLAGS)" \
	KLIB_BUILD="$(LINUX_DIR)" \
	MODPROBE=true \
	KLIB=$(TARGET_MODULES_DIR) \
	KERNEL_SUBLEVEL=$(lastword $(subst ., ,$(KERNEL_PATCHVER))) \
	KBUILD_LDFLAGS_MODULE_PREREQ=



define Build/Compile
	mkdir -p $(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/rtl8822b-sdio
	rm -rf $(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/rtl8822b-sdio/
	mkdir -p $(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/rtl8822b-usb
	rm -rf $(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/rtl8822b-usb/
	sed -i 's/EXTRA_CFLAGS +=/ccflags-y +=/g' $(PKG_BUILD_DIR)/Makefile
	#88x2bu
	mkdir -p $(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/rtl8822b-usb
	cp -rpf $(PKG_BUILD_DIR)/* $(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/rtl8822b-usb/.
	#88x2bs
	mkdir -p $(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/rtl8822b-sdio
	sed -i 's/CONFIG_USB_HCI = y/CONFIG_USB_HCI = n/g' $(PKG_BUILD_DIR)/Makefile
	sed -i 's/CONFIG_SDIO_HCI = n/CONFIG_SDIO_HCI = y/g' $(PKG_BUILD_DIR)/Makefile
	cp -rpf $(PKG_BUILD_DIR)/* $(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/rtl8822b-sdio/.
	#Makefile
	sed -i '$ a obj-y += rtl8822b-sdio/' $(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/Makefile
	sed -i '$ a obj-y += rtl8822b-usb/' $(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/drivers/net/wireless/Makefile
	rm -rf $(PKG_BUILD_DIR)/../backports-$(BACKPORTS_VER)/modules
	+$(MAKE) $(PKG_JOBS) $(MAKE_OPTS) modules

endef

$(eval $(call KernelPackage,rtl8822b-sdio-usb))
