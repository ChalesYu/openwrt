#
# Copyright (C) 2021 ChalesYu <574249312@qq.com>
# Copyright (C) 2017-2019 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

ARCH:=aarch64
BOARD:=sunxih6
BOARDNAME:=Allwinner H6
CPU_TYPE:=cortex-a53
DEVICE_TYPE:=other
FEATURES:=audio boot-part ext4 fpu squashfs usbgadget
MAINTAINER:=ChalesYu <574249312@qq.com>

KERNEL_PATCHVER:=5.10

define Target/Description
	Build firmware image for Allwinner H6 SoC devices.
endef

include $(INCLUDE_DIR)/target.mk

DEFAULT_PACKAGES += \
	e2fsprogs \
	kmod-sound-core \
	kmod-usb-hid \
	mkf2fs \
	partx-utils

KERNELNAME:=Image dtbs

$(eval $(call BuildTarget))
