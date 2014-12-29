TEMPLATE = app

QT += qml quick sensors positioning svg

SOURCES += main.cpp

# Automatically generated, containing gpodder source and QML files
RESOURCES += modrana.qrc

# Deployment
x86 {
    target.path = /libs/x86
} else: armeabi-v7a {
    target.path = /libs/armeabi-v7a
} else {
    target.path = /libs/armeabi
}
INSTALLS += target

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android

OTHER_FILES += $$ANDROID_PACKAGE_SOURCE_DIR/AndroidManifest.xml

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_EXTRA_LIBS =
}
