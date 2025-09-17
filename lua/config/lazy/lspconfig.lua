local map = vim.keymap.set

return {
	"neovim/nvim-lspconfig",

	config = function()
		-- local lspconfig = require("lspconfig")
		-- ruby support (ruby-lsp)
		-- lspconfig.rubocop.setup({})
		-- lspconfig.ruby_lsp.setup({
		-- 	init_options = {
		-- 		linters = { "rubocop", "erb_lint" },
		-- 	},
		-- })

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

				-- Fix issue with unpack/table.unpack being nil for some unknown reason...
				if unpack == nil then
					unpack = table.unpack
				end

				-- Go To's
				map("n", "gD", vim.lsp.buf.declaration, { unpack(opts), desc = "Go To Declaration" })
				map("n", "gd", vim.lsp.buf.definition, { unpack(opts), desc = "Go To Definition" })
				map("n", "gr", vim.lsp.buf.references, { unpack(opts), desc = "Go To References" })
				map("n", "go", vim.lsp.buf.type_definition, { unpack(opts), desc = "Go To Type Definition" })
				map("n", "gi", vim.lsp.buf.implementation, { unpack(opts), desc = "Go To Implementation" })

				map("n", "K", vim.lsp.buf.hover, { unpack(opts), desc = "LSP hover" })
				map("n", "<C-k>", vim.lsp.buf.signature_help, { unpack(opts), desc = "LSP Signature Help" })
				map(
					"n",
					"<leader>lwa",
					vim.lsp.buf.add_workspace_folder,
					{ unpack(opts), desc = "LSP Add Workspace Folder" }
				)
				map(
					"n",
					"<leader>lwr",
					vim.lsp.buf.remove_workspace_folder,
					{ unpack(opts), desc = "LSP Remove Workspace Folder" }
				)
				map("n", "<leader>lwl", function()
					print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
				end, { unpack(opts), desc = "LSP List Workspace Folders" })
				map("n", "<F2>", vim.lsp.buf.rename, { unpack(opts), desc = "Rename References" })
				map({ "n", "v" }, "<leader>lca", vim.lsp.buf.code_action, { unpack(opts), desc = "LSP Code Action" })
				map("n", "<leader>lfb", function()
					vim.lsp.buf.format({ async = true })
				end, { unpack(opts), desc = "LSP Format Buffer" })
			end,
		})
	end,
}
