#! /bin/bash

cd ~/.local/share/nvim/mason/packages/vue-language-server || exit
npm install @vue/typescript-plugin

# gem install group for ruby-lsp setup
gem install ruby-lsp rubocop rubocop-rails erb-formatter erb_lint