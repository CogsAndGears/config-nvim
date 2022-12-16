#!/usr/bin/env bash

# Creates links between all of these configuration settings and the user locations

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
NOW=`date +%s`

CONFIG_DIR="${HOME}/.config"

NVIM_CONFIG_DIR="${CONFIG_DIR}/nvim"
VIMRC_FILE="${HOME}/.vimrc"
VIM_CONFIG_DIR="${HOME}/.vim"

if [ -f "${VIMRC_FILE}" ]; then
	mv "${VIMRC_FILE}" "${VIMRC_FILE}.bak${NOW}"
	echo ".vimrc exists; backing up to: ${VIMRC_FILE}.bak${NOW}"
fi
ln -s "${SCRIPT_DIR}/vim/.vimrc" "${VIMRC_FILE}"
if [ -d "${VIM_CONFIG_DIR}" ]; then
	mv "${VIM_CONFIG_DIR}" "${VIM_CONFIG_DIR}.bak${NOW}"
	echo "Vim config directory exists; backing up to: ${VIM_CONFIG_DIR}.bak${NOW}"
fi
ln -s "${SCRIPT_DIR}/vim/.vim" "${VIM_CONFIG_DIR}"
if [ -d "${NVIM_CONFIG_DIR}" ]; then
	mv "${NVIM_CONFIG_DIR}" "${NVIM_CONFIG_DIR}.bak.${NOW}"
	echo "Neovim config dir exits; backing up to: ${NVIM_CONFIG_DIR}.bak${NOW}"
fi
ln -s "${SCRIPT_DIR}" "${NVIM_CONFIG_DIR}"
