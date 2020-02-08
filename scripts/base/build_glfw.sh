#!/usr/bin/env bash

set -ex

NUM_CPUS=$(command -v nproc>/dev/null && nproc || echo 4)

git clone https://github.com/glfw/glfw.git
cd glfw

if [ "$GLFW_VERSION" != "latest" ]; then
    git checkout "tags/${GLFW_VERSION}" -b "${GLFW_VERSION}"
fi

mkdir build
cd build

cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX="${ASWF_INSTALL_PREFIX}" ..
make -j "$NUM_CPUS"
make install

cd ../..
rm -rf glfw
