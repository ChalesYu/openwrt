#
# Copyright (C) 2017-2019 Stijn Tintel <stijn@linux-ipv6.be>
# Copyright (C) 2020-2021 ChalesYu <574249312@qq.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk

ARCH:=arm
BOARD:=meson
BOARDNAME:=Amlogic Meson family
FEATURES:=audio boot-part ext4 fpu squashfs usbgadget
MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
SUBTARGETS:=meson8b mesongx

KERNEL_PATCHVER:=5.4

define Target/Description
	Build firmware image for Amlogic Meson SoC devices.
	Currently produces SD Card/USB disk image for some TV box.
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
