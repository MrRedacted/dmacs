return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		require("telescope").setup({
			defaults = {
				file_ignore_patterns = {
					"^.git",
					"node_modules",
				},
			},
			pickers = {
				find_files = {
					hidden = true,
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Fuzzy Find" })
		vim.keymap.set("n", "<leader>fw", builtin.live_grep, { desc = "Live Grep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffer Find" })
	end,
}
