# dmacs
it's actually a neovim config :)

## Required software
- A Nerd Font (Hack Nerd Font is a great choice)
- ripgrep

## Get started
- be sure to back up any existing neovim configuration!
- to download, run `git clone https://github.com/MrRedacted/dmacs.git ~/.config/nvim --depth 1`
- after downloading, run `nvim` so that lazy.nvim can bootstrap itself
- once lazy's downloads are done, press 'q' to exit lazy, and then press `<space>mi` or run `MasonInstallAll` from within neovim to install pre-configured Mason list
- once Mason's installs are done, press 'q' once again to exit the Mason menu, and exit neovim
- run `~/.config/nvim/setup.sh` to run a fix for the current issue with vue-language-server and typescript support
    - this may be removed in the future if it is no longer needed
- run `nvim` once more and you are ready to use dmacs!

## Some notes:
  - You may need to install tree-sitter, run checkhealth to see if tree-sitter needs installed
    - example would be libtree-sitter on Fedora
  - Run checkhealth within tmux to see what changes to .tmux.conf should be made, or download my awesome NeoMux configuration for tmux! (https://github.com/MrRedacted/NeoMux)
