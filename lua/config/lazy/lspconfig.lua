local map = vim.keymap.set

local mason_ensure_installed = {
	-- debugger
	"codelldb",

	-- c
	"clangd",

	-- zig
	"zls",

	-- ruby
	-- these are now handled outside of mason
	-- "ruby-lsp",
	-- "rubocop",
	-- "erb-formatter",
	-- "erb-lint",

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

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/nvim-cmp",
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"j-hui/fidget.nvim",
	},

	config = function()
		local cmp = require("cmp")
		local cmp_lsp = require("cmp_nvim_lsp")
		local capabilities = vim.tbl_deep_extend(
			"force",
			{},
			vim.lsp.protocol.make_client_capabilities(),
			cmp_lsp.default_capabilities()
		)
		local lspconfig = require("lspconfig")

		-- ruby support (ruby-lsp)
		--lspconfig.rubocop.setup({})
		--lspconfig.ruby_lsp.setup({
		--	init_options = {
		--		linters = { "rubocop", "erb_lint" },
		--	},
		--})

		-- ruby support (solargraph)
		lspconfig.solargraph.setup({
			init_options = {
				linters = { "rubocop", "erb_lint" },
			},
		})

		require("fidget").setup({})

		require("mason").setup()
		vim.api.nvim_create_user_command("MasonInstallAll", function()
			if mason_ensure_installed and #mason_ensure_installed > 0 then
				vim.cmd("MasonInstall " .. table.concat(mason_ensure_installed, " "))
			end
		end, {})

		require("mason-lspconfig").setup({
			handlers = {
				function(server_name) -- default handler (optional)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				-- this is now handled outside of mason
				-- ["ruby_lsp"] = function()
				--   lspconfig.ruby_lsp.setup({
				--     capabilities = capabilities,
				--     init_options = {
				--       linters = { "rubocop", "erb_lint" },
				--     },
				--   })
				-- end,

				["ts_ls"] = function()
					lspconfig.ts_ls.setup({
						capabilities = capabilities,
						init_options = {
							plugins = {
								{
									name = "@vue/typescript-plugin",
									location = os.getenv("HOME")
										.. "/.local/share/nvim/mason/packages/vue-language-server/node_modules/@vue/typescript-plugin",
									languages = { "vue" },
								},
							},
						},
						filetypes = {
							"javascript",
							"typescript",
							"vue",
						},
					})
				end,

				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim", "it", "describe", "before_each", "after_each" },
								},
							},
						},
					})
				end,

				-- we do not want to do anything with rust_analyzer
				-- since that is covered by the mrcjkb/rustaceanvim plugin
				["rust_analyzer"] = function() end,
			},
		})

		local cmp_select = { behavior = cmp.SelectBehavior.Select }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
				["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
				["<C-y>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.close(),
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- For luasnip users.
			}, {
				{ name = "buffer" },
			}),
		})

		vim.diagnostic.config({
			-- update_in_insert = true,
			float = {
				focusable = false,
				style = "minimal",
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		-- Global mappings.
		-- See `:help vim.diagnostic.*` for documentation on any of the below functions
		map("n", "<leader>lod", vim.diagnostic.open_float, { desc = "Open Diagnostics" })
		map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostics" })
		map("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostics" })
		map("n", "<leader>lsl", vim.diagnostic.setloclist, { desc = "Set Loclist Diagnostics" })

		-- Use LspAttach autocommand to only map the following keys
		-- after the language server attaches to the current buffer
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				-- Enable completion triggered by <c-x><c-o>
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

				-- Buffer local mappings.
				-- See `:help vim.lsp.*` for documentation on any of the below functions
				local opts = { buffer = ev.buf }

				-- Go To's
				map("n", "gD", vim.lsp.buf.declaration, { table.unpack(opts), desc = "Go To Declaration" })
				map("n", "gd", vim.lsp.buf.definition, { table.unpack(opts), desc = "Go To Definition" })
				map("n", "gr", vim.lsp.buf.references, { table.unpack(opts), desc = "Go To References" })
				map("n", "go", vim.lsp.buf.type_definition, { table.unpack(opts), desc = "Go To Type Definition" })
				map("n", "gi", vim.lsp.buf.implementation, { table.unpack(opts), desc = "Go To Implementation" })

				map("n", "K", vim.lsp.buf.hover, { table.unpack(opts), desc = "LSP hover" })
				map("n", "<C-k>", vim.lsp.buf.signature_help, { table.unpack(opts), desc = "LSP Signature Help" })
				map(
					"n",
					"<leader>lwa",
					vim.lsp.buf.add_workspace_folder,
					{ table.unpack(opts), desc = "LSP Add Workspace Folder" }
				)
				map(
					"n",
					"<leader>lwr",
					vim.lsp.buf.remove_workspace_folder,
					{ table.unpack(opts), desc = "LSP Remove Workspace Folder" }
				)
				map("n", "<leader>lwl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, { table.unpack(opts), desc = "LSP List Workspace Folders" })
				map("n", "<F2>", vim.lsp.buf.rename, { table.unpack(opts), desc = "Rename References" })
				map(
					{ "n", "v" },
					"<leader>lca",
					vim.lsp.buf.code_action,
					{ table.unpack(opts), desc = "LSP Code Action" }
				)
				map("n", "<leader>lfb", function()
					vim.lsp.buf.format({ async = true })
				end, { table.unpack(opts), desc = "LSP Format Buffer" })
			end,
		})
	end,
}
