#!/bin/bash

set -ex

CYDIR=$(git rev-parse --show-toplevel)
G_DIR=$CYDIR/generators/gemmini/software/gemmini-rocc-tests
O_DIR=$CYDIR/software/custom-workloads/overlay/root

echo "Building Gemmini RoCC tests"
cd $G_DIR

./build.sh bareMetalC
cd build
rm -rf $O_DIR
mkdir -p $O_DIR
cp -r bareMetalC/simple_matmul-linux $O_DIR/
cp -r bareMetalC/simple_matmul_fence-linux $O_DIR/

echo "Complete!"
