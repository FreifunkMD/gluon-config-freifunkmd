#!/bin/bash
# (pushd/popd needs an advanced shell)

set -e

SCRIPTDIR=$(dirname $0)

print_usage() {
    echo "Usage: $0 [GLUON_BRANCH]"
    echo ''
    echo 'If GLUON_BRANCH is not given, experimental is set.'
    echo ''
    echo 'Options:'
    echo '  -h  show this help'
    echo '  -v  verbose mode'
}

# command line options handling
ARGS=`getopt hv $*`
if [ $? -ne 0 ]
then
    print_usage
    exit 2
fi
set -- $ARGS

while true
do
    case "$1" in
        -h)
            print_usage
            exit 0
            ;;
        -v)
            VERBOSE='V=s'
            shift
            ;;
        --)
            shift; break;;
    esac
done

# set GLUON_BRANCH for manifest
if [ -z "$1" ]
then
    GLUON_BRANCH=experimental
    echo 'Set GLUON_BRANCH to "experimental"!'
else
    GLUON_BRANCH=$1
fi

case "xx$GLUON_BRANCH" in
    'xxstable')
        GLUON_PRIORITY=14
        ;;
    'xxbeta')
        GLUON_PRIORITY=3
        ;;
    'xxexperimental')
        # use default GLUON_PRIORITY set in site.mk
        ;;
    *)
        echo "Unknown GLUON_BRANCH '$1'."
        echo 'Use "stable", "beta", or "experimental"!'
        exit 1
        ;;
esac

export GLUON_BRANCH GLUON_PRIORITY

# get GLUON_CHECKOUT from site dir
pushd ${SCRIPTDIR}
eval `make -s -f helper.mk`
echo "GLUON_CHECKOUT: ${GLUON_CHECKOUT}"

# build
pushd ..
git checkout master
git pull
git checkout ${GLUON_CHECKOUT}
make clean $VERBOSE
make update $VERBOSE
make -j4 $VERBOSE
make manifest $VERBOSE
popd

popd

exit 0

# vim: set et sts=0 ts=4 sw=4 sr:
