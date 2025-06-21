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
    version = "*",
    opts = {
      inlay_hints = { enabled = false },
      servers = {
        eslint = {
          settings = {
            workingDirectories = { mode = "auto" },
            experimental = {
              useFlatConfig = true,
            },
          },
        },
        lua_ls = {
          mason = false,
        },
        nixd = {
          nixpkgs = {
            expr = "import <nixpkgs> { }",
          },
          options = {
            nixos = {
              expr = '(builtins.getFlake ("git+file://" + toString ~/nixos)).nixosConfigurations.nixos.options',
            },
          },
        },
      },
    },
  },
}
