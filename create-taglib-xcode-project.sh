#!/bin/sh
set -euo pipefail

TAGLIB_DIR="${TAGLIB_DIR:-CocoaTagLib/taglib}"

cd $TAGLIB_DIR

cmake \
    -DCMAKE_BUILD_TYPE=Release -G Xcode \
    -DBUILD_FRAMEWORK=ON \
    -DCMAKE_C_COMPILER=`xcrun --find clang` \
    -DCMAKE_CXX_COMPILER=`xcrun --find clang++` \
    -DCMAKE_OSX_SYSROOT=`xcrun --sdk macosx --show-sdk-path` \
    -DCMAKE_OSX_DEPLOYMENT_TARGET=`xcrun --sdk macosx --show-sdk-version` \
    -DCMAKE_OSX_ARCHITECTURES="i386;x86_64"
