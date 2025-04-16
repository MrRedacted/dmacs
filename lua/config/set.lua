-- case insensitive searching
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- line numbers
vim.opt.nu = true

-- tab sizing
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.autoindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = false

-- highlight searches and search while typing
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

-- minimal number of lines to keep above
-- or below the cursor
vim.opt.scrolloff = 8

-- do not believe this is needed for me
vim.opt.signcolumn = "yes"

vim.opt.isfname:append("@-@")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrwSettings = 1
vim.g.loaded_netrwFileHandlers = 1
vim.g.loaded_netrw_gitignore = 1

-- fix issues with diagnostic messages not showing
-- to the right of code
vim.diagnostic.config({ virtual_text = true })