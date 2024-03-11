local map = vim.keymap.set

vim.g.mapleader = " "

-- misc
map("n", "<Esc>", "<cmd> noh <CR>", { desc = "Clear highlights" })
map("n", "<C-h>", "<C-w>h", { desc = "Switch Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Switch Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Switch Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Switch Window up" })
map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle Line number" })
map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle Relative number" })

-- global lsp mappings
map("n", "<leader>fm", function()
	vim.lsp.buf.format({ async = true })
end, { desc = "Lsp formatting" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Lsp diagnostics" })
map("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "Restart LSP" })
map("n", "<leader>li", "<cmd>LspInfo<CR>", { desc = "LSP Info" })

-- plugins
map("n", "<leader>la", "<cmd>Lazy<CR>", { desc = "Lazy" })
map("n", "<leader>mn", "<cmd>Mason<CR>", { desc = "Mason" })
map("n", "<leader>mi", "<cmd>MasonInstallAll<CR>", { desc = "Mason Install All" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "Whichkey all keymaps" })
map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "Whichkey query lookup" })
