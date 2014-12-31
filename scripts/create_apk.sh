#!/bin/bash
# Create a modRana Android package (APK)
# * make sure to run the clean_source.sh
#   script (or an equivalent) so that there
#   is some modRana source code available
#   to be package in ../modrana

# make sure the PWD is consistent even if the script is called
# from a different directory
cd "$(dirname "$0")"
# source the needed environmental variables

if [ ! -f "env.sh" ]
then
        echo "Error: Environment definition file is missing!"
        echo "You need to create an env.sh file in the scripts folder,"
        echo "which exports the following environmental variables:"
        echo "* ANDROID_NDK_ROOT - path to the root of an Android NDK"
        echo "* ANDROID_SDK_ROOT - path to the root of an Android SDK"
        echo "* ANDROID_QMAKE - path to qmake executable from the Qt Android SDK"
        exit 1
fi

source env.sh

APK_PATH=android-build/bin/QtApp-debug.apk
OUTPUT_FOLDER=apks
CURRENT_VERSION=`grep versionCode ../android/AndroidManifest.xml | sed -e 's/.*versionName\s*=\s*\"\([0-9.]*\)\".*/\1/g'`

cd ..

# generate the qrc manifest
echo "* cleaning *"
make clean
echo "* generating qrc manifest *"
./qrcgen.py modrana "/"
echo "* running qmake *"
$ANDROID_QMAKE modrana-android.pro -r -spec android-g++ CONFIG+=debug
echo "* running make *"
make
echo "* removing old android build dir *"
rm -rf android-build
echo "* running make install *"
make INSTALL_ROOT=android-build install

echo "* running creating apk *"
androiddeployqt --deployment bundled --android-platform android-14 --output android-build

echo "* moving resulting APKs to the apks folder *"
cp $APK_PATH ${OUTPUT_FOLDER}/modrana-latest.apk
mv $APK_PATH ${OUTPUT_FOLDER}/modrana-${CURRENT_VERSION}.apk

cd scripts
