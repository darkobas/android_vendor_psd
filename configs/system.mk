# All Official PSD ROMs use SM 4.8.3.  Non-official can use Google 4.8
SM_AND_PATH := prebuilts/gcc/$(HOST_PREBUILT_TAG)/arm/arm-linux-androideabi-4.8
SM_AND := $(shell $(SM_AND_PATH)/bin/arm-linux-androideabi-gcc --version)
ifneq ($(filter (SM-Toolchain), $(SM_AND)),)
SM_AND_NAME := (SM-Toolchain)
SM_AND_VERSION := $(filter 4.8 4.8.%, $(SM_AND))
SM_AND_DATE := $(filter 20140% 20141%, $(SM_AND))
SM_AND_STATUS := $(filter (release) (prerelease) (experimental), $(SM_AND))
SM_AND_VERSION := $(SM_AND_NAME)$(SM_AND_VERSION)($(SM_AND_DATE))-$(SM_AND_STATUS)
else
    # Can't find SM-Toolchain, giving up now
endif

ifneq ($(SM_AND_VERSION),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sm.android=$(SM_AND_VERSION)
endif
