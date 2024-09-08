#!/bin/bash
set -eu

show_help=false
# Parse command-line arguments
for arg in "$@"
do
    case $arg in
        -h|--help)
        show_help=true
        shift
        ;;
    esac
done

if $show_help ; then
    echo 'Build project and run command';
    echo
    echo 'Usage:';
    echo
    echo './scripts/run.sh [options]';
    echo 'Options:';
    echo
    echo '  -r, --rebuild...Rebuild libraries, and project then run target'
    echo '  -r, --glog......Rebuild glog library then run target'
    echo '  -a, --all.......Rebuild all libraries then run target'
    echo '  -h, --help......Show this help'
    echo 'Examples:';
    echo
    echo './scripts/run.sh -r ...................rebuild project then run target'
    echo './scripts/run.sh -r --glog.............rebuild glog and project then run target'
    echo './scripts/run.sh -r --all..............rebuild all libraries and project then run target'
    exit 0;
fi

./scripts/build.sh "$@"
./build/macos/CTruckMacos
