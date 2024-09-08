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
    echo 'Build kangaru library command';
    echo
    echo 'Usage:';
    echo
    echo './scripts/kangaru.sh [options]';
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
KANGARU_VERSION="4.3.2"
KANGARU_FILENAME="kangaru-$KANGARU_VERSION"
KANGARU_TARBALL_FILENAME="$KANGARU_FILENAME.zip"
if [ ! -d "kangaru" ]; then
    mkdir kangaru
fi
cd kangaru

# lib/SDL
if [ ! -f "$KANGARU_TARBALL_FILENAME" ]; then
    wget -O "$KANGARU_TARBALL_FILENAME"  "https://github.com/gracicot/kangaru/archive/refs/tags/v$KANGARU_VERSION.zip"
fi

if [ ! -d $KANGARU_FILENAME ]; then
    unzip $KANGARU_TARBALL_FILENAME
fi
cd $KANGARU_FILENAME
KANGARU_EXTRACTED_DIR=$(pwd)

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

cmake -S . -B build -DKANGARU_REVERSE_DESTRUCTION=true -DCMAKE_INSTALL_PREFIX="${KANGARU_EXTRACTED_DIR}/install"
cmake --build build
# cmake --build build --target test
cmake --build build --target install
