#!/bin/bash
set -eu

rebuild_flag=false
build_glog_flag=false
build_gtest_flag=false
build_raylib_flag=false
build_kangaru_flag=false
show_help=false
build_target=""
# Parse command-line arguments
for arg in "$@"
do
    case $arg in
        -r|--rebuild)
        rebuild_flag=true
        shift
        ;;

        --glog)
        build_glog_flag=true
        shift
        ;;

        --gtest)
        build_gtest_flag=true
        shift
        ;;

        --raylib)
        build_raylib_flag=true
        shift
        ;;

        --kangaru)
        build_kangaru_flag=true
        shift
        ;;

        -a|--all)
        build_glog_flag=true
        build_gtest_flag=true
        build_raylib_flag=true
        build_kangaru_flag=true
        shift
        ;;

        --target)
        build_target="$2"
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
    echo 'Build project command';
    echo
    echo 'Usage:';
    echo
    echo './scripts/build.sh [options]';
    echo 'Options:';
    echo
    echo '  -r, --rebuild...Rebuild libraries, and project'
    echo '  -r, --glog......Rebuild glog library'
    echo '  -a, --all.......Rebuild all libraries'
    echo '  -h, --help......Show this help'
    echo 'Examples:';
    echo
    echo './scripts/build.sh -r ...............rebuild project'
    echo './scripts/build.sh -r --glog.........rebuild glog and project'
    echo './scripts/build.sh -r --all..........rebuild all libraries and project'
    exit 0;
fi

if $rebuild_flag ; then
    rm -Rf ./build
fi

if $build_glog_flag ; then
    if $rebuild_flag ; then
        ./scripts/glog.sh --rebuild
    else
        ./scripts/glog.sh
    fi
fi

if $build_gtest_flag ; then
    if $rebuild_flag ; then
        ./scripts/googletest.sh --rebuild
    else
        ./scripts/googletest.sh
    fi
fi

if $build_raylib_flag ; then
    if $rebuild_flag ; then
        ./scripts/raylib.sh --rebuild
    else
        ./scripts/raylib.sh
    fi
fi

if $build_kangaru_flag ; then
    if $rebuild_flag ; then
        ./scripts/kangaru.sh --rebuild
    else
        ./scripts/kangaru.sh
    fi
fi


if [ ! -d "build" ]; then
    mkdir build
fi
cd build
cmake .. -DCMAKE_BUILD_TYPE=Debug
if [ -z "$build_target" ]; then
    cmake --build .
else
    cmake --build . --target "$build_target"
fi
