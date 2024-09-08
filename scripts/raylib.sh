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
    echo 'Build raylib library command';
    echo
    echo 'Usage:';
    echo
    echo './scripts/raylib.sh [options]';
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
# fi



# SDL
RAYLIB_VERSION="5.0"
RAYLIB_FILENAME="raylib-$RAYLIB_VERSION"
RAYLIB_TARBALL_FILENAME="$RAYLIB_FILENAME.tar.gz"
if [ ! -d "raylib" ]; then
    mkdir raylib
fi
cd raylib

# lib/SDL
if [ ! -f "$RAYLIB_TARBALL_FILENAME" ]; then
    wget -O "$RAYLIB_TARBALL_FILENAME"  "https://github.com/raysan5/raylib/archive/refs/tags/$RAYLIB_VERSION.zip"
fi

if [ ! -d $RAYLIB_FILENAME ]; then
    tar -xzf $RAYLIB_TARBALL_FILENAME
fi
cd $RAYLIB_FILENAME
RAYLIB_EXTRACTED_DIR=$(pwd)

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

cmake -S . -B build -DCMAKE_CXX_FLAGS="-std=c++11" -DCMAKE_CXX_STANDARD=11 -DCMAKE_INSTALL_PREFIX="${RAYLIB_EXTRACTED_DIR}/install"
cmake --build build
cmake --build build --target test
cmake --build build --target install
