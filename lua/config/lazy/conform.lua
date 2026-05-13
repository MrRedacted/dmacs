return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			timeout_ms = 7000,
			--lsp_fallback = true,

			formatters_by_ft = {
				lua = { "stylua" },

				zig = { "zigfmt" },

				ruby = { lsp_format = "fallback" },
				eruby = { "erb_format" },

				sh = { "shfmt" },

				go = { "goimports", "gofumpt" },

				rust = { "rustfmt" },

				html = { "prettier" },
				css = { "prettier" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				vue = { "prettier" },
				json = { "prettier" },

				python = { "yapf" },

				php = { "php_cs_fixer" },

				java = { lsp_format = "prefer" },
			},

			--format_on_save = {
			--	timeout_ms = 7000,
			--	--lsp_fallback = true,
			--},
		})

		vim.keymap.set("n", "<leader>af", function()
			require("conform").format()
		end, { desc = "Auto Format" })

		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf })
			end,
		})
	end,
}
