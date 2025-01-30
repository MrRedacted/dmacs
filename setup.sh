#! /bin/bash

cd ~/.local/share/nvim/mason/packages/vue-language-server || exit
npm install @vue/typescript-plugin

gem install rubocop ruby-lsp erb-formatter