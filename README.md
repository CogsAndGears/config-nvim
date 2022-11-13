# Neovim Configuration

This directory contains the plugin and user configuration files used by NeoVim to manage and install plugins.

# Updating plugin configuration

First, make the changes necessary to the plugin configurations (adding dependencies, changing startup scripts, etc)

Next, run `:PackerSync`; make sure all of the new changes are synchronized correctly.

Then, create a snapshot of the current packer configuration. `:PackerSnapshot <filename>`. This will create a snapshot file inside of `nvim/snapshots`

Lastly, update the snapshot configuration inside of `nvim/lua/user/plugins.lua` to point to the new filename. This locks the plugin versions being used until the next time a synchronize and snapshot is run.
