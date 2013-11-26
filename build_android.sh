#!/bin/bash

if [ -z "$ANDROID_NDK" ]; then
	echo "You must define ANDROID_NDK before starting."
	echo "They must point to your NDK directories.\n"
	exit 1
fi

SOURCE=`pwd`
PREFIX=$SOURCE/build/android

SYSROOT=$ANDROID_NDK/platforms/android-18/arch-arm
CROSS_PREFIX=$ANDROID_NDK/toolchains/arm-linux-androideabi-4.8/prebuilt/linux-x86_64/bin/arm-linux-androideabi-

./configure  --prefix=$PREFIX \
  --host=$CROSS_PREFIX \
  --enable-shared \
  --with-sysroot=$SYSROOT

make clean
make -j4 install || exit 1

