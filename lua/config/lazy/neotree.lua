return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      close_if_last_window = false,
      follow_current_file = { enabled = true },
      filesystem = {
        hijack_netrw_behavior = "open_current",
        filtered_items = {
          visible = true
        }
      },
      event_handlers = {
        {
          event = "file_opened",
          handler = function()
            require("neo-tree.command").execute({ action = "close" })
          end,
        },
      },
    })

    vim.keymap.set("n", "<leader>ex", "<cmd> Neotree %<CR>", { desc = "Neotree" })
    vim.keymap.set("n", "<leader>ec", "<cmd> Neotree close<CR>", { desc = "Close Neotree" })
    vim.keymap.set("n", "<C-n>", "<cmd> Neotree toggle<CR>", { desc = "Toggle Neotree" })
    -- vim.keymap.set("n", "<leader>eb", "<cmd> Neotree buffers<CR>", { desc = "Neotree Buffers" })
  end,
}
