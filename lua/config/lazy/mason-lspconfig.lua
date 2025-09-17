-- local cmp_lsp = require("cmp_nvim_lsp")
-- local capabilities =
-- 	vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())
-- local lspconfig = require("lspconfig")

local vue_plugin = {
	{
		name = "@vue/typescript-plugin",
		location = os.getenv("HOME")
			.. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin",
		languages = { "vue" },
		configNamespace = "typescript",
	},
}

return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
	opts = {
		ensure_installed = {},
		handlers = {
			-- function(server_name) -- default handler (optional)
			-- 	lspconfig[server_name].setup({
			-- 		capabilities = capabilities,
			-- 	})
			-- end,

			vim.lsp.config("vtsls", {
				settings = {
					vtsls = {
						tsserver = {
							globalPlugins = {
								vue_plugin,
							},
						},
					},
				},
				filetypes = {
					"javascript",
					"typescript",
					"vue",
				},
			}),

			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim", "it", "describe", "before_each", "after_each" },
						},
					},
				},
			}),

			-- we do not want to do anything with rust_analyzer
			-- since that is covered by the mrcjkb/rustaceanvim plugin
			vim.lsp.config("rust_analyzer", {}),
		},
	},
}
