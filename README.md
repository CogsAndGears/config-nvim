# Neovim Configuration

This directory contains the plugin and user configuration files used by NeoVim to manage and install plugins.

# Updating plugin configuration

First, make the changes necessary to the plugin configurations (adding dependencies, changing startup scripts, etc)

Next, run `:PackerSync`; make sure all of the new changes are synchronized correctly.

Then, create a snapshot of the current packer configuration. `:PackerSnapshot <filename>`. This will create a snapshot file inside of `nvim/snapshots`

Lastly, update the snapshot configuration inside of `nvim/lua/user/plugins.lua` to point to the new filename. This locks the plugin versions being used until the next time a synchronize and snapshot is run.

# Shortcuts

Leader character: `,`

## General

- `n` - Normal mode
- `i` - Insert mode

| Mode | Shortcut | Effect |
| ------ | ---- | ---- |
| <td colspan=2>**General**</td> |
| `n` | `zz` | Center cursor |
| `n` | `z.` | Center cursor, move cursor to front of line |
| `n` | `#gg` | Go to line # |
| `n` | `G` | Go to last line |
| `n` | `<leader>rn` | Rename symbol under cursor |
| `n` | `:%s/<find>/<replace>/gc` | Globally confirm replacement of `<find>` with `<replace>`. Omit `c` to skip confirmation, omit `%` to only replace once |
| <td colspan=2>**Coc**</td> |
| `i` | `<cr>` | Accept suggestion |
| `i` | `<c-j>` | Trigger snippets |
| `i` | `<c-space>` | Trigger completion list |
| `n` | `[g` | Previous diagnostics |
| `n` | `]g` | Next diagnostics |
| `n` | `gd` | Go to definition of symbol |
| `n` | `gy` | Go to type definition of symbol |
| `n` | `gi` | Go to implementation of symbol |
| `n` | `gr` | Go to references of symbol |
| `n` | `K`  | Show documentation of symbol |
| <td colspan=2>**Mason**</td> |
| <td colspan=2>*Attached on a buffer load for each language server*</td> |
| `n` | `gD` | Go to declaration of symbol |
| `n` | `gd` | Go to definition of symbol |
| `n` | `gi` | Go to implementation of symbol |
| `n` | `gr` | Go to references of symbol |
| `n` | `K`  | Show symbol information |
| `n` | `<C-k>` | Show signature help for symbol |
| <td colspan=2>*Rust-specific*</td> |
| `n` | `<C-space>` | Trigger hover actions |
| `n` | `<leader>a` | Trigger code action group |
| <td colspan=2>**Telescope**</td> |
| `n` | `<leader>ff` | Find file with browser |
| `n` | `<leader>fg` | Find file with grep (having RipGrep installed is recommended) |
| `n` | `<leader>fb` | Browse open buffers |
| `n` | `<leader>fh` | Browse help |
| <td colspan=2>**Tree**</td> |
| `n` | `<leader>e` | Open/close tree browser |
| `n` | `f` | Filter files |
| <td colspan=2>**Mason**</td> |
| `n` | `:Mason` | Open Mason plugin browser |
| <td colspan=2>**Packer**</td> |
| `n` | `:PackerSync` | Update cached Packer configuration |
| `n` | `:PackerSnapshot [name]` | Add new snapshot called `[name]` |
| <td colspan=2>**Dap-UI**</td> |
| `n` | `<cr>` | Expand |
| `n` | `o` | Open |
| `n` | `d` | Remove |
| `n` | `e` | Edit |
| `n` | `r` | Repl |
| `n` | `t` | Toggle |
| <td colspan=2>**Treesitter**</td> |
| `n` | `<leader>J` | Function.outer |
| `n` | `<leader>Q` | Class.outer |
| <td colspan=2>**ToggleTerm**</td> |
| `n` | `<c-\>` | Open/close terminal |
| <td colspan=2>**CMP**</td> |
| `n` | `<C-b>` | Scroll docs up |
| `n` | `<C-f>` | Scroll docs down |
| `n` | `<C-Space>` | Trigger completions |
| `n` | `<C-e>` | Close completions |
| `n` | `<CR>` | Accept currently selected completion |
