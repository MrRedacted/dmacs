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
	"typescript-language-server",
	"eslint-lsp",
	"vue-language-server",
	"vtsls",
	"tailwindcss-language-server",
	"json-lsp",
	"prettier",

	-- go
	"gopls",
	"goimports",
	"gofumpt",

	-- rust
	"rust-analyzer",

	-- python
	"python-lsp-server",
	"yapf",

	-- awk
	"awk-language-server",

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
