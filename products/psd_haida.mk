ifeq (psd_haida,$(TARGET_PRODUCT))

include vendor/psd/configs/psd_modular.mk

# Include Paranoid SaberDroid common configuration
include vendor/psd/main.mk

# Call pa device
$(call inherit-product, vendor/pa/products/pa_haida.mk)

# Inherit device configuration
$(call inherit-product, device/semc/haida/full_haida.mk)

# Override AOSP build properties
PRODUCT_NAME := psd_haida
PRODUCT_DEVICE := haida
PRODUCT_BRAND := SEMC
PRODUCT_MANUFACTURER := Sony Ericsson
PRODUCT_MODEL := MT11i
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=MT11i \
    PRODUCT_DEVICE=MT11i \
    BUILD_FINGERPRINT="SEMC/MT11i_1254-2184/MT11i:4.0.4/4.1.B.0.587/tL1_3w:user/release-keys" \
    PRIVATE_BUILD_DESC="MT11i-user 4.0.4 4.1.B.0.587 tL1_3w test-keys"

endif
