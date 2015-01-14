# Copyright (C) 2014 ParanoidAndroid Project
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


# Add PA bootanimation based on xxhdpi xhdpi hdpi tvdpi resolution


# PA XXHDPI Devices
ifneq ($(filter psd_bacon psd_d802 psd_d855 psd_flo psd_p5100,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/psd/prebuilt/bootanimation/bootanimation.zip:system/media/bootanimation.zip
endif
