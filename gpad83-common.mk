#
# Copyright 2014 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

PRODUCT_CHARACTERISTICS := tablet

DEVICE_PACKAGE_OVERLAYS := device/lge/gpad83-common/overlay

TARGET_SCREEN_HEIGHT := 1920
TARGET_SCREEN_WIDTH := 1200

PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xhdpi
PRODUCT_AAPT_PREBUILT_DPI := xhdpi 280dpi hdpi tvdpi mdpi ldpi

$(call inherit-product, frameworks/native/build/tablet-7in-xhdpi-2048-dalvik-heap.mk)

# Audio
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio@2.0-service \
    android.hardware.audio.effect@2.0-impl \
    android.hardware.audio.effect@2.0-service \
    audio.primary.msm8960 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler

PRODUCT_COPY_FILES += \
    device/lge/gpad83-common/configs/audio_policy.conf:system/vendor/etc/audio_policy.conf \
    device/lge/gpad83-common/configs/mixer_paths.xml:system/vendor/etc/mixer_paths.xml

# Bluetooth
PRODUCT_COPY_FILES += \
    device/lge/gpad83-common/configs/init.qcom.bt.sh:system/bin/init.qcom.bt.sh

PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-impl \
    libbt-vendor

PRODUCT_PROPERTY_OVERRIDES += \
    qcom.bluetooth.soc=smd \
    ro.qualcomm.bt.hci_transport=smd

# CABL
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.cabl=0

# Camera
PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-impl-legacy \
    camera.device@1.0-impl-legacy \
    camera.msm8960 \
    libcamera_shim \
    Snap

# Configure libhwui
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hwui.texture_cache_size=48 \
    ro.hwui.layer_cache_size=32 \
    ro.hwui.r_buffer_cache_size=4 \
    ro.hwui.path_cache_size=24 \
    ro.hwui.gradient_cache_size=1 \
    ro.hwui.drop_shadow_cache_size=5 \
    ro.hwui.texture_cache_flushrate=0.5 \
    ro.hwui.text_small_cache_width=1024 \
    ro.hwui.text_small_cache_height=1024 \
    ro.hwui.text_large_cache_width=2048 \
    ro.hwui.text_large_cache_height=1024

PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.dex2oat-swap=false

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# GPS
PRODUCT_PACKAGES += \
    android.hardware.gnss@1.0-impl \
    gps.conf \
    gps.msm8960

# Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.allocator@2.0-service \
    android.hardware.graphics.mapper@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.memtrack@1.0-impl \
    libgenlock \
    hwcomposer.msm8960 \
    gralloc.msm8960 \
    copybit.msm8960 \
    memtrack.msm8960

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608 \
    ro.sf.lcd_density=320 \
    persist.hwc.mdpcomp.enable=true \
    debug.egl.recordable.rgba8888=1 \
    debug.hwui.use_buffer_age=false

# Hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/vendor/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/vendor/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/vendor/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/vendor/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/vendor/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/vendor/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/vendor/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/vendor/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/vendor/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/vendor/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/vendor/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/vendor/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/vendor/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/vendor/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/vendor/etc/permissions/handheld_core_hardware.xml

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@1.0-impl \
    android.hardware.health@1.0-service

# Hwaddrs
PRODUCT_PACKAGES += \
    hwaddrs

# Keymaster HIDL interfaces
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

# Lights
PRODUCT_PACKAGES += \
    android.hardware.light@2.0-impl \
    lights.msm8960

# Media
PRODUCT_COPY_FILES += \
    device/lge/gpad83-common/configs/media_codecs.xml:system/vendor/etc/media_codecs.xml \
    device/lge/gpad83-common/configs/media_codecs_performance.xml:system/vendor/etc/media_codecs_performance.xml \
    device/lge/gpad83-common/configs/media_profiles_V1_0.xml:system/vendor/etc/media_profiles_V1_0.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/vendor/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/vendor/etc/media_codecs_google_video.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.aac_51_output_enabled=true \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true

# OMX
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

PRODUCT_PROPERTY_OVERRIDES += \
    persist.media.treble_omx=false

# Power HAL
PRODUCT_PACKAGES += \
    android.hardware.power@1.0-impl \
    power.msm8960

# Rootdir
PRODUCT_COPY_FILES += \
    device/lge/gpad83-common/rootdir/fstab.qcom:root/fstab.qcom \
    device/lge/gpad83-common/rootdir/init.qcom.rc:root/init.qcom.rc \
    device/lge/gpad83-common/rootdir/init.qcom.power.rc:root/init.qcom.power.rc \
    device/lge/gpad83-common/rootdir/init.qcom.usb.rc:root/init.qcom.usb.rc \
    device/lge/gpad83-common/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc

# Sensors
PRODUCT_PACKAGES += \
    android.hardware.sensors@1.0-impl

PRODUCT_PROPERTY_OVERRIDES += \
    ro.qc.sensors.wl_dis=true \
    ro.qualcomm.sensors.smd=true

# Storage
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sys.sdcardfs=true

# Thermal
PRODUCT_COPY_FILES += \
    device/lge/gpad83-common/configs/thermald.conf:system/etc/thermald.conf

# Vibrator
PRODUCT_PACKAGES += \
    android.hardware.vibrator@1.0-impl

# Wifi
PRODUCT_PACKAGES += \
    android.hardware.wifi@1.0-service \
    conn_init \
    hostapd \
    wificond \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    device/lge/gpad83-common/configs/init.qcom.wifi.sh:system/bin/init.qcom.wifi.sh

PRODUCT_COPY_FILES += \
    device/lge/gpad83-common/wifi/p2p_supplicant_overlay.conf:system/vendor/etc/wifi/p2p_supplicant_overlay.conf \
    device/lge/gpad83-common/wifi/wpa_supplicant_overlay.conf:system/vendor/etc/wifi/wpa_supplicant_overlay.conf

PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0
