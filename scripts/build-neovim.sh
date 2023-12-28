#!/usr/bin/env bash

set -e

if [[ -z "${MY_APP_DIR}" ]]; then
  MY_APP_DIR=/srv/app
fi
NEOVIM_CHECKOUT=stable

BUILD_DIR="${MY_APP_DIR}/build/neovim"
if [ ! -d "${BUILD_DIR}" ]; then
  if [ ! -d "${MY_APP_DIR}/build" ]; then
    mkdir --parents "${MY_APP_DIR}/build"
  fi
  cd "${MY_APP_DIR}/build"
  git clone git@github.com:neovim/neovim.git "${BUILD_DIR}"
fi
cd "${BUILD_DIR}"
git checkout "${NEOVIM_CHECKOUT}"
INSTALL_DIR="${MY_APP_DIR}/install/neovim/${NEOVIM_CHECKOUT}"
make CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=${INSTALL_DIR}"
make install

