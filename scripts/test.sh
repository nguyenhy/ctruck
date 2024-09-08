#!/bin/bash
set -eu

show_help=false
ctest_flags=""
# Parse command-line arguments
for arg in "$@"
do
    case $arg in
        -h|--help)
        show_help=true
        shift
        ;;

        --ctest-debug)
        ctest_flags+=" --debug"
        shift
        ;;

        *)
        shift
        ;;
    esac
done

if $show_help ; then
    echo 'Build project and test command';
    echo
    echo 'Usage:';
    echo
    echo './scripts/test.sh [options]';
    exit 0;
fi

./scripts/build.sh "$@"
ctest --test-dir ./build/tests --output-on-failure --stop-on-failure -VV $ctest_flags
