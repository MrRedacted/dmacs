return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>ba", function()
			harpoon:list():append()
		end, { desc = "Harpoon Buffer Append" })
		vim.keymap.set("n", "<leader>be", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Harpoon Buffer List" })

		vim.keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end, { desc = "Harpoon Buffer 1" })
		vim.keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end, { desc = "Harpoon Buffer 2" })
		vim.keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end, { desc = "Harpoon Buffer 3" })
		vim.keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end, { desc = "Harpoon Buffer 4" })
		vim.keymap.set("n", "<leader>5", function()
			harpoon:list():select(5)
		end, { desc = "Harpoon Buffer 5" })
		vim.keymap.set("n", "<leader>6", function()
			harpoon:list():select(6)
		end, { desc = "Harpoon Buffer 6" })
		vim.keymap.set("n", "<leader>7", function()
			harpoon:list():select(7)
		end, { desc = "Harpoon Buffer 7" })
		vim.keymap.set("n", "<leader>8", function()
			harpoon:list():select(8)
		end, { desc = "Harpoon Buffer 8" })
		vim.keymap.set("n", "<leader>9", function()
			harpoon:list():select(9)
		end, { desc = "Harpoon Buffer 9" })

		-- Toggle previous & next buffers stored within Harpoon list
		vim.keymap.set("n", "<Tab>", function()
			harpoon:list():next({ ui_nav_wrap = true })
		end, { desc = "Harpoon Buffer Next" })
		vim.keymap.set("n", "<S-Tab>", function()
			harpoon:list():prev({ ui_nav_wrap = true })
		end, { desc = "Harpoon Buffer Prev" })
	end,
}
