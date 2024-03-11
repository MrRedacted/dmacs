return {
	{
		"ellisonleao/gruvbox.nvim",
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
}
