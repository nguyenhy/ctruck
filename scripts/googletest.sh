#!/bin/bash
set -eu

rebuild_flag=false
show_help=false

for arg in "$@"
do
    case $arg in
        -r|--rebuild)
        rebuild_flag=true
        shift
        ;;

        -h|--help)
        show_help=true
        shift
        ;;

        *)
        shift
        ;;
    esac
done

if $show_help ; then
    echo 'Build google test library command';
    echo
    echo 'Usage:';
    echo
    echo './scripts/glog.sh [options]';
    echo 'Options:';
    echo
    echo '  -r, --rebuild...Rebuild library from beginning'
    echo '  -h, --help......Show this help'
    exit 0;
fi


if [ ! -d "lib" ]; then
    mkdir lib
fi

cd lib

# SDL
GOOGLETEST_VERSION="1.15.2"
GOOGLETEST_FILENAME="googletest-$GOOGLETEST_VERSION"
GOOGLETEST_TARBALL_FILENAME="$GOOGLETEST_FILENAME.tar.gz"
if [ ! -d "googletest" ]; then
    mkdir googletest
fi
cd googletest

# lib/SDL
if [ ! -f "$GOOGLETEST_TARBALL_FILENAME" ]; then
    wget -O "$GOOGLETEST_TARBALL_FILENAME"  "https://github.com/google/googletest/releases/download/v$GOOGLETEST_VERSION/googletest-$GOOGLETEST_VERSION.tar.gz"
fi

if [ ! -d $GOOGLETEST_FILENAME ]; then
    tar -xzf $GOOGLETEST_TARBALL_FILENAME
fi
cd $GOOGLETEST_FILENAME
GOOGLETEST_EXTRACTED_DIR=$(pwd)

# lib/SDL/SDL-version
if [ ! -d "install" ]; then
    mkdir install
fi

if $rebuild_flag ; then
    echo "rebuild library"
    rm -Rf build
fi

if [ ! -d "build" ]; then
    mkdir build
fi

cmake -S . -B build -G "Unix Makefiles" -DCMAKE_CXX_FLAGS="-std=c++14" -DCMAKE_CXX_STANDARD=14 -DCMAKE_INSTALL_PREFIX="${GOOGLETEST_EXTRACTED_DIR}/install"
cmake --build build
cmake --build build --target test
cmake --build build --target install
