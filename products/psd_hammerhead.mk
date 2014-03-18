# Device info
PSD_TARGET_PRODUCT := psd_hammerhead

SM_ARM_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-4.9
SM_ARM := $(shell $(SM_ARM_PATH)/bin/arm-eabi-gcc --version)
ifneq ($(filter (SM-Toolchain), $(SM_ARM)),)
SM_ARM_NAME := (SM-Toolchain)
SM_ARM_VERSION := $(filter 4.9 4.9.%, $(SM_ARM))
SM_ARM_DATE := $(filter 20140% 20141%, $(SM_ARM))
SM_ARM_STATUS := $(filter (release) (prerelease) (experimental), $(SM_ARM))
SM_ARM_VERSION := $(SM_ARM_NAME)$(SM_ARM_VERSION)($(SM_ARM_DATE))-$(SM_ARM_STATUS)
else
# Default to 4.8 if no SM-Toolchain
SM_ARM_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-eabi-4.8
SM_ARM := $(shell $(SM_ARM_PATH)/bin/arm-eabi-gcc --version)
ifneq ($(filter (SM-Toolchain), $(SM_ARM)),)
SM_ARM_NAME := (SM-Toolchain)
SM_ARM_VERSION := $(filter 4.8 4.8.%, $(SM_ARM))
SM_ARM_DATE := $(filter 20140% 20141%, $(SM_ARM))
SM_ARM_STATUS := $(filter (release) (prerelease) (experimental), $(SM_ARM))
SM_ARM_VERSION := $(SM_ARM_NAME)$(SM_ARM_VERSION)($(SM_ARM_DATE))-$(SM_ARM_STATUS)
else
    # Can't find SM-Toolcahin, giving up now
endif
endif

ifneq ($(SM_ARM_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.arm=$(SM_ARM_VERSION)
endif
