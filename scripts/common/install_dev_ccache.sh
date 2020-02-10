#!/usr/bin/env bash

set -ex

NUM_CPUS=$(command -v nproc>/dev/null && nproc || echo 4)

mkdir ccache
cd ccache

CCACHE_VERSION=3.7.4
if [ ! -f "$DOWNLOADS_DIR/ccache-${CCACHE_VERSION}.tar.gz" ]; then
    curl --location "https://github.com/ccache/ccache/releases/download/v${CCACHE_VERSION}/ccache-${CCACHE_VERSION}.tar.gz" -o "$DOWNLOADS_DIR/ccache-${CCACHE_VERSION}.tar.gz"
fi

tar xf "$DOWNLOADS_DIR/ccache-${CCACHE_VERSION}.tar.gz"

cd "ccache-${CCACHE_VERSION}" || exit 1
./configure --prefix=/opt/aswfbuilder
make -j "$NUM_CPUS"
make install

ln -s /opt/aswfbuilder/bin/ccache /opt/aswfbuilder/bin/gcc
ln -s /opt/aswfbuilder/bin/ccache /opt/aswfbuilder/bin/g++
ln -s /opt/aswfbuilder/bin/ccache /opt/aswfbuilder/bin/cc
ln -s /opt/aswfbuilder/bin/ccache /opt/aswfbuilder/bin/c++

cd ../..
rm -rf ccache
