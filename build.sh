#!/bin/bash
#
# Created by Michael S Corigliano for Team AOSPAL (michael.s.corigliano@gmail.com)
# Parts of the original AOSPA build script have also been implemented in this script,
# it can be found here: https://www.github.com/AOSPA/android_vendor_pa/build.sh
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
convertsecs() {
 ((h=${1}/3600))
 ((m=(${1}%3600)/60))
 ((s=${1}%60))
 printf "%02d:%02d:%02d\n" $h $m $s
}

# Get build version
   PA_MAJOR=$(cat vendor/psd/vendor.mk | grep 'PA_VERSION_MAJOR := *' | sed  's/PA_VERSION_MAJOR := //g')
   PA_MINOR=$(cat vendor/psd/vendor.mk | grep 'PA_VERSION_MINOR := *' | sed  's/PA_VERSION_MINOR := //g')
   PA_MAINTENANCE=$(cat vendor/psd/vendor.mk | grep 'PA_VERSION_MAINTENANCE := *' | sed  's/PA_VERSION_MAINTENANCE := //g')
   PA_TAG=$(cat vendor/psd/vendor.mk | grep 'PA_VERSION_TAG := *' | sed  's/PA_VERSION_TAG := //g')
#
   PSD_MAJOR=$(cat vendor/psd/vendor.mk | grep 'PSD_VERSION_MAJOR := *' | sed  's/PSD_VERSION_MAJOR := //g')
   PSD_MINOR=$(cat vendor/psd/vendor.mk | grep 'PSD_VERSION_MINOR := *' | sed  's/PSD_VERSION_MINOR := //g')
   PSD_MAINTENANCE=$(cat vendor/psd/vendor.mk | grep 'PSD_VERSION_MAINTENANCE := *' | sed  's/PSD_VERSION_MAINTENANCE := //g')
   PSD_TAG=$(cat vendor/psd/vendor.mk | grep 'PSD_TYPE := *' | sed  's/PSD_TYPE := //g')
# Get build version
MAJOR=$(cat vendor/psd/vendor.mk | grep 'PA_VERSION_MAJOR := *' | sed  's/PA_VERSION_MAJOR := //g')
MINOR=$(cat vendor/psd/vendor.mk | grep 'PA_VERSION_MINOR := *' | sed  's/PA_VERSION_MINOR := //g')
MAINTENANCE=$(cat vendor/psd/vendor.mk | grep 'PA_VERSION_MAINTENANCE := *' | sed  's/PA_VERSION_MAINTENANCE := //g')
TAG=$(cat vendor/psd/vendor.mk | grep 'PA_VERSION_TAG := *' | sed  's/PA_VERSION_TAG := //g')

if [ -n "$TAG" ]; then
        VERSION=$MAJOR.$MINOR$MAINTENANCE-$TAG
else
        VERSION=$MAJOR.$MINOR$MAINTENANCE
fi

DEVICE="$1"
#Use Prebuilt Chromium
#export USE_PREBUILT_CHROMIUM=1
 
#Generate Changelog
export CHANGELOG=true

# start
   echo -e "Building Paranoid SaberDroid for $DEVICE";
   echo -e "$PA_TAG $PA_MAJOR.$PA_MINOR";
   echo -e "$PSD_TAG $PSD_MAJOR.$PSD_MINOR for $DEVICE";
   echo -e "";
   echo -e ""
 
# make 'build-logs' directory if it doesn't already exist
   echo -e "Making a 'build-logs' directory if you haven't already...";
   mkdir -p build-logs
 
# invoke the environment setup script to start the building process
   echo -e "Setting up build environment..."
   . build/envsetup.sh
   clear

echo "create new changelog ?
	1) yes 
	2) no"
read n
case $n in
1)
echo -e "generating changelog....."
./vendor/psd/utils/changelog.sh
echo -e "$PRODUCT_OUT/CHANGELOG.txt created"
;;
2)
echo "skippin changelog"
;;
*) invalid option;;
esac

lunch psd_$DEVICE-userdebug
   echo -e "Starting build...";
rm $OUT/system/build.prop
START=$(date +%s)
mka bacon 2>&1 | tee build-logs/psd_$DEVICE-$timestamp.txt
END=$(date +%s)
DIFF=$(( $END - $START ))
# we're done
   echo -e "Finished building Darkobas PSD RoM in $(convertsecs $DIFF)";
   echo -e "If for some reason your build failed,";
   echo -e "please check the 'build-logs' directory to figure out why.";
   echo -e "";
   echo -e ""
