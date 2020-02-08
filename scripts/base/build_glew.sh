#!/usr/bin/env bash

set -ex

NUM_CPUS=$(command -v nproc>/dev/null && nproc || echo 4)

if [ ! -f "${DOWNLOADS_DIR}/glew-${GLEW_VERSION}.tgz" ]; then
    curl --location "https://github.com/nigels-com/glew/releases/download/glew-${GLEW_VERSION}/glew-${GLEW_VERSION}.tgz" -o "${DOWNLOADS_DIR}/glew-${GLEW_VERSION}.tgz"
fi

tar xf "${DOWNLOADS_DIR}/glew-${GLEW_VERSION}.tgz"

cd "glew-${GLEW_VERSION}/build"
cmake ./cmake -DCMAKE_INSTALL_PREFIX="${ASWF_INSTALL_PREFIX}"
make -j "$NUM_CPUS"
make install

cd ../..
rm -rf "glew-${GLEW_VERSION}"
