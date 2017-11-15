#!/bin/bash

pushd node_exporter
../build_rpm.sh --name node_exporter --release 0.15.1 --build-number ${BUILD_NUMBER}
popd
