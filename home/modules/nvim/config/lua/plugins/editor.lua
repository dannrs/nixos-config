return {
  {
    "dinhhuy258/git.nvim",
    event = "BufReadPre",
    opts = {
      keymaps = {
        -- Open blame window
        blame = "<Leader>gb",
        -- Open file/folder in git repository
        browse = "<Leader>go",
      },
    },
  },
  {
    "ibhagwan/fzf-lua",
    opts = {
      fzf_colors = {
        true,
        ["bg"] = "-1",
        ["gutter"] = "-1",
      },
    },
  },
}
