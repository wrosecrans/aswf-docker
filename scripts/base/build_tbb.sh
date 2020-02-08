#!/usr/bin/env bash

set -ex

NUM_CPUS=$(command -v nproc>/dev/null && nproc || echo 4)

git clone https://github.com/01org/tbb.git
cd tbb

if [ "$TBB_VERSION" != "latest" ]; then
    git checkout "tags/${TBB_VERSION}" -b "${TBB_VERSION}"
fi

make -j "$NUM_CPUS"

mkdir -p "${ASWF_INSTALL_PREFIX}/include"
mkdir -p "${ASWF_INSTALL_PREFIX}/lib"

cp -r include/serial "${ASWF_INSTALL_PREFIX}/include/."
cp -r include/tbb "${ASWF_INSTALL_PREFIX}/include/."
cp -r build/*/*.so* "${ASWF_INSTALL_PREFIX}/lib/."

cd ..
rm -rf tbb
