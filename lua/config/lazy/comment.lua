return {
  "numToStr/Comment.nvim",
  config = function()
    --require("Comment").setup()
    vim.keymap.set("n", "<leader>/", function()
      require("Comment.api").toggle.linewise.current()
    end, { desc = "Comment Toggle" })
    vim.keymap.set(
      "v",
      "<leader>/",
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      { desc = "Comment Toggle" }
    )
  end,
}
