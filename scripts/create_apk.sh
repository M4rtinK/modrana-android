#!/bin/bash
# Create a modRana Android package (APK)
# * make sure to run the clean_source.sh
#   script (or an equivalent) so that there
#   is some modRana source code available
#   to be package in ../modrana

# make sure the PWD is consistent even if the script is called
# from a different directory
cd "$(dirname "$0")"

APK_PATH=android-build/bin/QtApp-debug.apk
OUTPUT_FOLDER=apks
CURRENT_VERSION=`grep versionCode ../android/AndroidManifest.xml | sed -e 's/.*versionName\s*=\s*\"\([0-9.]*\)\".*/\1/g'`

cd ..

# generate the qrc manifest
./qrcgen.py modrana "/"

androiddeployqt --deployment bundled --android-platform android-14 --output android-build

cp $APK_PATH ${OUTPUT_FOLDER}/modrana-latest.apk
mv $APK_PATH ${OUTPUT_FOLDER}/modrana-${CURRENT_VERSION}.apk

cd scripts
