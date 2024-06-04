return {
	"folke/trouble.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("trouble").setup()

		vim.keymap.set("n", "<leader>er", function()
			require("trouble").toggle({
				mode = "diagnostics",
				focus = true,
				filter = {
					buf = 0,
				},
			})
		end, { desc = "Trouble Diagnostics" })
		vim.keymap.set("n", "<leader>ef", function()
			require("trouble").toggle({
				mode = "quickfix",
				focus = true,
				filter = {
					buf = 0,
				},
			})
		end, { desc = "Trouble Quickfix" })
	end,
}
