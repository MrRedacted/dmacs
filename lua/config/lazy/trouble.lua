return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("trouble").setup()

		vim.keymap.set("n", "<leader>eg", function()
			require("trouble").toggle()
		end, { desc = "Trouble" })
		vim.keymap.set("n", "<leader>ew", function()
			require("trouble").toggle("workspace_diagnostics")
		end, { desc = "Trouble Workspace" })
		vim.keymap.set("n", "<leader>er", function()
			require("trouble").toggle("document_diagnostics")
		end, { desc = "Trouble Document" })
		vim.keymap.set("n", "<leader>ef", function()
			require("trouble").toggle("quickfix")
		end, { desc = "Trouble Quickfix" })
	end,
}
