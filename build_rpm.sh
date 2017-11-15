#!/bin/bash

# Defaults
RPM_BUILD_ROOT=/root
SIGN=1
NAME=
RELEASE=


usage()
{
    echo "usage: build_rpm.sh --name name [--rpm-build-root path] [--no-sign]"
    echo "       --name           - the name of the rpm to build"
    echo "       --release        - the version of the rpm to build"
    echo "       --rpm-build-root - the path where /rpmbuild exists for your user"
    echo "       --no-sign        - don't try to sign the build"
}

while [ "$1" != "" ]; do
    case $1 in
        --name )            shift
                            NAME=$1
                            ;;

        --release )         shift
                            RELEASE=$1
                            ;;

        --rpm-build-root )  shift
                            RPM_BUILD_ROOT=$1
                            ;;

        --no-sign )         SIGN=0
                            ;;

        --build-number )    shift
                            BUILD_NUMBER=$1
                            ;;

        -h | --help )       usage
                            exit
                            ;;

        * )                 usage
                            exit 1

    esac
    shift
done

if [ -z ${NAME} ]; then
    echo "--name option must be set."
else
    echo "Building rpm for ${NAME}"
fi

if [ -z ${RELEASE} ]; then
    echo "--name option must be set."
else
    echo "Building rpm for ${RELEASE}"
fi

spectool -g -R ${NAME}.spec
cp ${NAME}.initd       ${RPM_BUILD_ROOT}/rpmbuild/SOURCES/.
cp ${NAME}.supervisord ${RPM_BUILD_ROOT}/rpmbuild/SOURCES/.

if [ 0 = $SIGN ]; then
    yes "" | rpmbuild -ba \
        --define "_ver ${RELEASE}" \
        --define "_releaseno ${BUILD_NUMBER}" \
        ${NAME}.spec
else
    yes "" | rpmbuild -ba --sign \
        --define "_signature gpg" \
        --define "_gpg_name Comcast Xmidt Team <CHQSV-Xmidt-Gpg@comcast.com>" \
        --define "_ver ${RELEASE}" \
        --define "_releaseno ${BUILD_NUMBER}" \
        ${NAME}.spec
fi
