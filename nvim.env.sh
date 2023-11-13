if [ -z "${MY_APP_DIR}" ]; then
  echo "Set MY_APP_DIR in your configuration"
  return 1
fi
# Sets neovim variables
# NVIM support directory contains installations of binaries and programs that are
# explicitly for NeoVim's usage, such as Python
export MY_NVIM_SUPPORT="${MY_APP_DIR}/nvim-support/"
export MY_NVIM_SUPPORT_PYTHON="${MY_NVIM_SUPPORT}/python"
if [ ! -d "${MY_NVIM_SUPPORT}" ]; then
	mkdir --parents "${MY_NVIM_SUPPORT}"
fi
if [ ! -d "${MY_NVIM_SUPPORT_PYTHON}" ]; then
	echo "Creating nvim support python virtual environment at: ${MY_NVIM_SUPPORT_PYTHON}"
	pushd "${MY_NVIM_SUPPORT}"
	python3 -m venv ${MY_NVIM_SUPPORT_PYTHON}
	"${MY_NVIM_SUPPORT_PYTHON}/bin/python" -m pip install --upgrade pip
	"${MY_NVIM_SUPPORT_PYTHON}/bin/python" -m pip install pyright
fi

# add neovim to path
export PATH=${MY_APP_DIR}/install/neovim/installed/bin:${PATH}
