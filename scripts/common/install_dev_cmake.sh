#!/usr/bin/env bash

set -ex

if [ ! -f "${DOWNLOADS_DIR}/cmake-3.12.4-Linux-x86_64.sh" ]; then
    curl --location "https://github.com/Kitware/CMake/releases/download/v3.12.4/cmake-3.12.4-Linux-x86_64.sh" -o "${DOWNLOADS_DIR}/cmake-3.12.4-Linux-x86_64.sh"
fi
sh "${DOWNLOADS_DIR}/cmake-3.12.4-Linux-x86_64.sh" --skip-license --prefix=/opt/aswfbuilder --exclude-subdir
