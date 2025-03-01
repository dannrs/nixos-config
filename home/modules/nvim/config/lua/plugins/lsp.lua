return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      for i = #opts.ensure_installed, 1, -1 do
        if opts.ensure_installed[i] == "stylua" then
          table.remove(opts.ensure_installed, i)
        end
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        lua_ls = {
          mason = false,
        },
        nil_ls = {},
      },
    },
  },
}
