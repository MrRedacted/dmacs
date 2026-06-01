local mason_ensure_installed = {
	-- debugger
	"codelldb",

	-- c
	"clangd",

	-- zig
	"zls",

	-- bash
	"bash-language-server",
	"shellcheck",
	"shfmt",

	-- lua
	"lua-language-server",
	"stylua",

	-- web dev
	"html-lsp",
	"css-lsp",
	--"typescript-language-server",
	"vtsls",
	"eslint-lsp",
	"vue-language-server",
	"tailwindcss-language-server",
	"json-lsp",
	"prettier",

	-- go
	"gopls",
	"goimports",
	"gofumpt",

	-- rust
	--"rust-analyzer",

	-- python
	"ruff",

	-- awk
	"awk-language-server",

	-- php
	"intelephense",
	"php-cs-fixer",

	-- misc
	"yaml-language-server",
}

vim.api.nvim_create_user_command("MasonInstallAll", function()
	if mason_ensure_installed and #mason_ensure_installed > 0 then
		vim.cmd("MasonInstall " .. table.concat(mason_ensure_installed, " "))
	end
end, {})

return {
	"mason-org/mason.nvim",
	opts = {},
}
