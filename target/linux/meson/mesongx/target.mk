#
# Copyright (C) 2017-2019 Stijn Tintel <stijn@linux-ipv6.be>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

ARCH:=aarch64
SUBTARGET:=mesongx
BOARDNAME:=Amlogic S9 SoC family (64 bit)
CPU_TYPE:=cortex-a53
MAINTAINER:=Stijn Tintel <stijn@linux-ipv6.be>
KERNEL_PATCHVER:=4.19

define Target/Description
	Build firmware image for Amlogic S9 SoC devices.
	This firmware features a 64 bit kernel.
endef
