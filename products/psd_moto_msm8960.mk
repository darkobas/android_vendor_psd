ifeq (psd_moto_msm8960,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_moto_msm8960.mk)

# Inherit AOSP device configuration
$(call inherit-product, device/motorola/moto_msm8960/full_moto_msm8960.mk)

# Override AOSP build properties
PRODUCT_DEVICE := moto_msm8960
PRODUCT_NAME := psd_moto_msm8960
PRODUCT_BRAND := motorola
PRODUCT_MODEL := xt926
PRODUCT_MANUFACTURER := motorola

endif
