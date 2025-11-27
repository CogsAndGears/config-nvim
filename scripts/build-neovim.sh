#!/usr/bin/env bash

set -e

# `stable` is the most recent
NVIM_VERSION=v0.11.5

if [[ -z "${MY_APP_DIR}" ]]; then
  MY_APP_DIR=/srv/app
fi
NEOVIM_CHECKOUT=$NVIM_VERSION

BUILD_DIR="${MY_APP_DIR}/build/neovim"
if [ ! -d "${BUILD_DIR}" ]; then
  if [ ! -d "${MY_APP_DIR}/build" ]; then
    mkdir --parents "${MY_APP_DIR}/build"
  fi
  cd "${MY_APP_DIR}/build"
  git clone git@github.com:neovim/neovim.git "${BUILD_DIR}"
else
  cd "${BUILD_DIR}"
  git fetch --tags --force
fi
cd "${BUILD_DIR}"
git checkout "${NEOVIM_CHECKOUT}"
git clean -dxf
INSTALL_DIR="${MY_APP_DIR}/install/neovim/${NEOVIM_CHECKOUT}"
make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}"
make install

