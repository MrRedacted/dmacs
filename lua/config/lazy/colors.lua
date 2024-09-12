return {
	{
		"ellisonleao/gruvbox.nvim",
		lazy = true,
		config = function()
			require("gruvbox").setup({
				italic = {
					strings = false,
					emphasis = false,
					comments = false,
					operators = false,
					folds = true,
				},
			})
		end,
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = true,
	},
	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		priority = 1000,
	},
	{
		"rebelot/kanagawa.nvim",
		lazy = true,
		config = function()
			require("kanagawa").setup({
				commentStyle = { italic = false },
				keywordStyle = { italic = false },
			})
		end,
	}
}
