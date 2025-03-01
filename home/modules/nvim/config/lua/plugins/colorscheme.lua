return {
  "folke/tokyonight.nvim",
  lazy = true,
  priority = 1000,
  config = function(_, opts)
    local tokyonight = require("tokyonight")

    opts.style = "night"

    if not vim.g.neovide then
      opts.transparent = true
      opts.styles = {
        sidebars = "transparent",
        floats = "transparent",
      }
    end

    tokyonight.setup(opts)
  end,
}
