return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("todo-comments").setup({
      colors = {
        error = { "#cc241d" },
        warning = { "#d79921" },
        info = { "#458588" },
        hint = { "#689d6a" },
        default = { "#b16286" },
        test = { "#d65d0e" }
      }
    })

    vim.keymap.set("n", "<leader>ft", "<cmd> TodoTelescope <CR>", { desc = "Find Todos" })
  end,
}
