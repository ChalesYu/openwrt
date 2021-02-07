#
# Copyright (C) 2021 ChalesYu <574249312@qq.com>
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#
include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/image.mk


FAT32_BLOCK_SIZE=1024
FAT32_BLOCKS=$(shell echo $$(($(CONFIG_TARGET_KERNEL_PARTSIZE)*1024*1024/$(FAT32_BLOCK_SIZE))))

define Build/sdcard-img
	$(RM) -f $@.boot
	mkfs.fat -C $@.boot $(FAT32_BLOCKS)
	mkdir -p $(KDIR)/boot.ext4

#FIXME: This H6 board share the same boot workaround with libreelec.

	$(CP) $(KDIR_KERNEL_IMAGE) $(KDIR)/boot.ext4/Image
	mcopy -i $@.boot $(KDIR)/boot.ext4/Image ::
	$(RM) -rf $(KDIR)/boot.ext4

	$(foreach dts,$(shell echo $(DEVICE_DTS)),mcopy -i $@.boot $(DTS_DIR)/$(dts).dtb ::;)

	../../bcm27xx/image/gen_rpi_sdcard_img.sh $@ $@.boot $(IMAGE_ROOTFS) \
		$(CONFIG_TARGET_KERNEL_PARTSIZE) $(CONFIG_TARGET_ROOTFS_PARTSIZE)

endef

#define Build/uImage-sunxih6
	#$(call Build/uImage,none)
	# Needn't to build uImage.
#endef

### Devices ###
define Device/Default
  FILESYSTEMS := ext4 squashfs
  IMAGES := sdcard.img
  IMAGE/sdcard.img := sdcard-img $$(DEVICE_NAME)
  KERNEL_DEPENDS = $$(wildcard $(DTS_DIR)/$$(DEVICE_DTS).dts)
  KERNEL_LOADADDR := 0x40080000
  KERNEL_NAME := Image
  PROFILES = Default $$(DEVICE_NAME)
endef

define Device/h6-nopmu-board
  DEVICE_DTS := allwinner/sun50i-h6-tanix-tx6
  DEVICE_PACKAGES += 
  DEVICE_TITLE := Allwinner H6 Reference Board Without PMU
  KERNEL := kernel-bin
endef
TARGET_DEVICES += h6-nopmu-board

$(eval $(call BuildImage))
