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
    echo 'Build glog library command';
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
GLOG_VERSION="0.7.1"
GLOG_FILENAME="glog-$GLOG_VERSION"
GLOG_TARBALL_FILENAME="$GLOG_FILENAME.tar.gz"
if [ ! -d "glog" ]; then
    mkdir glog
fi
cd glog

# lib/SDL
if [ ! -f "$GLOG_TARBALL_FILENAME" ]; then
    wget -O "$GLOG_TARBALL_FILENAME"  "https://github.com/google/glog/archive/refs/tags/v$GLOG_VERSION.tar.gz"
fi

if [ ! -d $GLOG_FILENAME ]; then
    tar -xzf $GLOG_TARBALL_FILENAME
fi
cd $GLOG_FILENAME
GLOG_EXTRACTED_DIR=$(pwd)

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

cmake -S . -B build -G "Unix Makefiles" -DCMAKE_CXX_FLAGS="-std=c++14" -DCMAKE_CXX_STANDARD=14 -DCMAKE_INSTALL_PREFIX="${GLOG_EXTRACTED_DIR}/install"
cmake --build build
cmake --build build --target test
cmake --build build --target install
