#! /bin/bash

# Vue typescript plugin for vue language server
read -r -p 'Install vue typescript plugin (y/N)?' ans
if [ "$ans" = 'y' ] || [ "$ans" = 'Y' ]; then
  cd ~/.local/share/nvim/mason/packages/vue-language-server || exit
  npm install @vue/typescript-plugin
fi

# Gem install group for ruby-lsp setup
read -r -p 'Install ruby gems for ruby lsp support (y/N)?' ans
if [ "$ans" = 'y' ] || [ "$ans" = 'Y' ]; then
  gem install ruby-lsp rubocop rubocop-rails erb-formatter erb_lint
fi