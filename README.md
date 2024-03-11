# dmacs
it's actually a neovim config :)

## Required software
- A Nerd Font (Hack Nerd Font is a great choice)
- ripgrep

## Get started
- Be sure to back up any existing neovim configuration!
- To download, run `git clone https://github.com/MrRedacted/dmacs.git ~/.config/nvim --depth 1`
- After downloading, run `nvim` so that Lazy.nvim can bootstrap itself
- Once Lazy's downloads are done, press 'q' to exit Lazy, and then press `<space>mi` or run `MasonInstallAll` from within neovim to install pre-configured Mason list
- Once Mason's installs are done, press 'q' once again to exit the Mason menu, and then exit neovim
- Run `~/.config/nvim/setup.sh` to run a fix for the current issue with vue-language-server and typescript support
    - This may be removed in the future if it is no longer needed
- Run `nvim` once more and you are ready to use dmacs!
    - You can update neovim plugins within Lazy (access via `<space>la` within neovim)
    - You can update Mason installs within Mason (access via `<space>mn` within neovim)

## Some notes:
- You may need to install tree-sitter, run checkhealth to see if tree-sitter needs installed
    - An example would be libtree-sitter on Fedora
- Run checkhealth within tmux to see what changes to .tmux.conf should be made, or download my awesome NeoMux configuration for tmux! (https://github.com/MrRedacted/NeoMux)
