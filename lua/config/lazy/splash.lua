return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local alpha = require("alpha")
    local theme = require("alpha.themes.dashboard")
    theme.section.header.val = {
      "██████╗ ███╗   ███╗ █████╗  ██████╗███████╗",
      "██╔══██╗████╗ ████║██╔══██╗██╔════╝██╔════╝",
      "██║  ██║██╔████╔██║███████║██║     ███████╗",
      "██║  ██║██║╚██╔╝██║██╔══██║██║     ╚════██║",
      "██████╔╝██║ ╚═╝ ██║██║  ██║╚██████╗███████║",
      "╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝╚══════╝",
    }

    theme.section.buttons.val = {
      theme.button("<leader> f f", "󰈞  Find file"),
      theme.button("<leader> f w", "󰈬  Find word"),
      theme.button("<leader> f t", "  Find todo"),
      theme.button("<leader> f b", "  Find buffer"),
      theme.button("<leader> b e", "󱡁  Harpoon buffer list"),
      theme.button("<leader> 1-9", "󱋿  Jump to harpoon buffer"),
      theme.button("ctrl-n", "  Open tree"),
    }

    alpha.setup(theme.config)
  end,
}
