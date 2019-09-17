#!/bin/sh

ANDROID_NDK=/Users/simsun/Library/Android/sdk/ndk-bundle
ANDROID_NATIVE_API_LEVEL=19
TARGETS="armeabi-v7a x86"
ANDROID_TOOLCHAIN=$ANDROID_NDK/build/cmake/android.toolchain.cmake
CMAKE_BUILD_TYPE=debug
BUILD_PATH=build

for TARGET in ${TARGETS}
do
    mkdir -p ${BUILD_PATH}/${TARGET}
    cd ./${BUILD_PATH}/${TARGET}

    cmake \
        -DANDROID_NATIVE_API_LEVEL=${ANDROID_NATIVE_API_LEVEL} \
        -DCMAKE_TOOLCHAIN_FILE=${ANDROID_TOOLCHAIN} \
        -DANDROID_NDK=${ANDROID_NDK} \
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE} \
        -DANDROID_ABI=${TARGET} \
        ../../

    make
    cd -
done
