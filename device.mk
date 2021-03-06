
include device/tinno/$(MTK_TARGET_PROJECT)/ProjectConfig.mk

# PRODUCT_COPY_FILES += device/tinno/s4300ae/egl.cfg:system/lib/egl/egl.cfg
# PRODUCT_COPY_FILES += device/tinno/s4300ae/ueventd.mt6582.rc:root/ueventd.mt6582.rc

PRODUCT_COPY_FILES += device/tinno/s4300ae/factory_init.project.rc:root/factory_init.project.rc
PRODUCT_COPY_FILES += device/tinno/s4300ae/init.project.rc:root/init.project.rc
PRODUCT_COPY_FILES += device/tinno/s4300ae/meta_init.project.rc:root/meta_init.project.rc

# Add FlashTool needed files
#PRODUCT_COPY_FILES += device/tinno/s4300ae/EBR1:EBR1
#PRODUCT_COPY_FILES += device/tinno/s4300ae/EBR2:EBR2
#PRODUCT_COPY_FILES += device/tinno/s4300ae/MBR:MBR
#PRODUCT_COPY_FILES += device/tinno/s4300ae/MT6582_Android_scatter.txt:MT6582_Android_scatter.txt



# alps/vendor/mediatek/proprietary/binary/3rd-party/free/SRS_AudioEffect/srs_processing/Android.mk
ifeq ($(strip $(HAVE_SRSAUDIOEFFECT_FEATURE)),yes)
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/binary/3rd-party/free/SRS_AudioEffect/srs_processing/license/srsmodels.lic:system/data/srsmodels.lic
endif

# alps/vendor/mediatek/proprietary/external/GeoCoding/Android.mk
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/GeoCoding/geocoding.db:system/etc/geocoding.db

# alps/vendor/mediatek/proprietary/frameworks-ext/native/etc/Android.mk
# sensor related xml files for CTS
ifneq ($(strip $(CUSTOM_KERNEL_ACCELEROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_MAGNETOMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_ALSPS)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
else
  ifneq ($(strip $(CUSTOM_KERNEL_PS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml
  endif
  ifneq ($(strip $(CUSTOM_KERNEL_ALS)),)
    PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml
  endif
endif

ifneq ($(strip $(CUSTOM_KERNEL_GYROSCOPE)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml
endif

ifneq ($(strip $(CUSTOM_KERNEL_BAROMETER)),)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml
endif

# touch related file for CTS
ifeq ($(strip $(CUSTOM_KERNEL_TOUCHPANEL)),generic)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
else
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.faketouch.xml:system/etc/permissions/android.hardware.faketouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml
endif

PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# GPS relative file
ifeq ($(MTK_GPS_SUPPORT),yes)
  PRODUCT_COPY_FILES += frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml
endif

# alps/external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/Android.mk
# PRODUCT_COPY_FILES += external/libnfc-opennfc/open_nfc/hardware/libhardware/modules/nfcc/nfc_hal_microread/driver/open_nfc_driver.ko:system/lib/open_nfc_driver.ko

# alps/frameworks/av/media/libeffects/factory/Android.mk
PRODUCT_COPY_FILES += frameworks/av/media/libeffects/data/audio_effects.conf:system/etc/audio_effects.conf

# alps/mediatek/config/$project
PRODUCT_COPY_FILES += device/tinno/s4300ae/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# alps/mediatek/external/sip/
ifeq ($(MTK_SIP_SUPPORT),yes)
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/enable_sip/android.software.sip.xml:system/etc/permissions/android.software.sip.xml
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/enable_sip/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
else
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/disable_sip/android.software.sip.xml:system/etc/permissions/android.software.sip.xml
  PRODUCT_COPY_FILES += vendor/mediatek/proprietary/external/sip/disable_sip/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml
endif

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.sys.usb.config=mtp
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += persist.service.acm.enable=0
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.mount.fs=EXT4

PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapgrowthlimit=96m
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.heapsize=128m

# meta tool
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.chip_ver=S01
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.version.release=ALPS.W10.24.p0
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.platform=MT6582
PRODUCT_PROPERTY_OVERRIDES += ro.mediatek.version.sdk=1

#custom version & tinno version
PRODUCT_PROPERTY_OVERRIDES += ro.custom.build.version=WIKO%20JIMMY%20Version%208
PRODUCT_PROPERTY_OVERRIDES += ro.custom.build.de.version=WIKO%20JIMMY%20Version%2015
PRODUCT_PROPERTY_OVERRIDES += ro.internal.build.version=S4300AE_MP_FR_WIK_08_15

# Audio Related Resource
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/s4300ae/factory/res/sound/testpattern1.wav:system/res/sound/testpattern1.wav
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/s4300ae/factory/res/sound/ringtone.wav:system/res/sound/ringtone.wav

# Keyboard layout
PRODUCT_COPY_FILES += device/mediatek/mt6582/ACCDET.kl:system/usr/keylayout/ACCDET.kl
PRODUCT_COPY_FILES += device/tinno/s4300ae/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl

# Microphone
PRODUCT_COPY_FILES += device/tinno/s4300ae/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml

# Camera
PRODUCT_COPY_FILES += device/tinno/s4300ae/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml

# Audio Policy
PRODUCT_COPY_FILES += device/tinno/s4300ae/audio_policy.conf:system/etc/audio_policy.conf

#Images for LCD test in factory mode
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/s4300ae/factory/res/images/lcd_test_00.png:system/res/images/lcd_test_00.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/s4300ae/factory/res/images/lcd_test_01.png:system/res/images/lcd_test_01.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/s4300ae/factory/res/images/lcd_test_02.png:system/res/images/lcd_test_02.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/s4300ae/factory/res/images/lcd_test_03.png:system/res/images/lcd_test_03.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/s4300ae/factory/res/images/lcd_test_04.png:system/res/images/lcd_test_04.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/s4300ae/factory/res/images/lcd_test_05.png:system/res/images/lcd_test_05.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/s4300ae/factory/res/images/lcd_test_06.png:system/res/images/lcd_test_06.png
PRODUCT_COPY_FILES += vendor/mediatek/proprietary/custom/s4300ae/factory/res/images/lcd_test_07.png:system/res/images/lcd_test_07.png

# USB
PRODUCT_COPY_FILES += device/tinno/s4300ae/init.mt6582usb.rc:root/init.mt6582usb.rc

# overlay has priorities. high <-> low.#lxz add overlay for S4300AE
DEVICE_PACKAGE_OVERLAYS += vendor/tinno/s4300ae/overlay
ifdef OPTR_SPEC_SEG_DEF
  ifneq ($(strip $(OPTR_SPEC_SEG_DEF)),NONE)
    OPTR := $(word 1,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SPEC := $(word 2,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    SEG  := $(word 3,$(subst _,$(space),$(OPTR_SPEC_SEG_DEF)))
    DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/operator/$(OPTR)/$(SPEC)/$(SEG)
  endif
endif
ifneq (yes,$(strip $(MTK_TABLET_PLATFORM)))
  ifeq (480,$(strip $(LCM_WIDTH)))
    ifeq (854,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/FWVGA
    endif
  endif
  ifeq (540,$(strip $(LCM_WIDTH)))
    ifeq (960,$(strip $(LCM_HEIGHT)))
      DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/qHD
    endif
  endif
endif
ifeq (yes,$(strip $(MTK_LCA_ROM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/LCA_rom
endif
ifeq (yes,$(strip $(MTK_LCA_RAM_OPTIMIZE)))
  DEVICE_PACKAGE_OVERLAYS += device/mediatek/common/overlay/LCA_ram
endif

# inherit 6582 platform
$(call inherit-product, device/mediatek/mt6582/device.mk)

$(call inherit-product-if-exists, vendor/tinno/libs/tinno82_we_aosp_kk/device-vendor.mk)

#yixuhong 20140728 add,package tinno app
PRODUCT_PACKAGES += TinnoProductInfo
PRODUCT_PACKAGES += akmd09911

ifeq (yes,$(strip $(TUI_APP_MUSIC)))
  PRODUCT_PACKAGES += TNMusic
endif
ifeq (yes,$(strip $(TUI_APP_WEATHERWIDGET)))
  PRODUCT_PACKAGES += TinnoWeatherWidget
endif
ifeq (yes,$(strip $(TUI_APP_SOUNDRECORDER)))
  PRODUCT_PACKAGES += TNSoundRecorder
endif
ifeq (yes,$(strip $(TUI_APP_LED)))
  PRODUCT_PACKAGES += TinnoLED
endif
ifeq (yes,$(strip $(TUI_APP_OTA)))
  PRODUCT_PACKAGES += TNSystemUpdate
endif
ifeq ($(strip $(TINNO_GESTURE_SUPPORT)),yes)
  PRODUCT_PACKAGES += GesturePhone
endif
#lxz add for boot animation
PRODUCT_COPY_FILES += vendor/tinno/s4300ae/bootanimation/bootanimation.zip:system/media/bootanimation.zip
# Customer configurations
PRODUCT_COPY_FILES += device/tinno/s4300ae/custom.conf:system/etc/custom.conf
# Audio resource
$(call inherit-product-if-exists, vendor/tinno/s4300ae/sounds/AudioPackage.mk)
#tinnoOTA configuration file
#PRODUCT_COPY_FILES += vendor/tinno/tinnoapp/TinnoOTA/ota_settings.xml:system/etc/ota_settings.xml
# $(call inherit-product, frameworks/native/build/tablet-dalvik-heap.mk)
#setting configuration file
PRODUCT_COPY_FILES += vendor/tinno/s4300ae/etc/settings-config.xml:system/etc/settings-config.xml
#lxz add ftm init file
#PRODUCT_COPY_FILES +=device/tinno/s4300ae/factory/essential.ini:etc/essential.ini
#PRODUCT_COPY_FILES +=device/tinno/s4300ae/factory/factory.ini:etc/factory.ini
#PRODUCT_COPY_FILES +=device/tinno/s4300ae/factory/pcba.ini:etc/pcba.ini
#lion add for wiko
$(call inherit-product, vendor/tinno/s4300ae/wikoapk/wikoapk.mk)
ifeq ($(strip $(MTK_PRIVACY_PROTECTION_LOCK)),yes)
  PRODUCT_PACKAGES += PrivacyProtectionLock
  PRODUCT_PROPERTY_OVERRIDES += ro.mtk_privacy_protection_lock=1
endif

