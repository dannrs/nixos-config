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
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      { "<leader>fa", "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
      {
        "<leader>fb",
        function()
          local telescope = require("telescope")
          local function telescope_buffer_dir()
            return vim.fn.expand("%:p:h")
          end

          telescope.extensions.file_browser.file_browser({
            path = "%:p:h",
            cwd = telescope_buffer_dir(),
            respect_gitignore = false,
            hidden = true,
            grouped = true,
            previewer = false,
            initial_mode = "normal",
            layout_config = { height = 40 },
          })
        end,
        desc = "File browser",
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions

      opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
        wrap_results = true,
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        mappings = {
          n = {},
        },
      })

      if vim.g.neovide then
        opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
          winblend = 30,
        })
      end

      opts.pickers = {
        diagnostics = {
          theme = "ivy",
          initial_mode = "normal",
          layout_config = {
            preview_cutoff = 9999,
          },
        },
      }

      opts.extensions = {
        file_browser = {
          theme = "dropdown",
          -- disables netrw and use telescope-file-browser in its place
          hijack_netrw = true,
          mappings = {
            -- your custom insert mode mappings
            ["n"] = {
              -- your custom normal mode mappings
              ["N"] = fb_actions.create,
              ["h"] = fb_actions.goto_parent_dir,
              ["/"] = function()
                vim.cmd("startinsert")
              end,
              ["<C-u>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_previous(prompt_bufnr)
                end
              end,
              ["<C-d>"] = function(prompt_bufnr)
                for i = 1, 10 do
                  actions.move_selection_next(prompt_bufnr)
                end
              end,
              ["<PageUp>"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },
          },
        },
      }
      telescope.setup(opts)
      require("telescope").load_extension("file_browser")
    end,
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    lazy = true,
    cmd = { "ToggleTerm" },
    keys = {
      {
        "<leader>tf",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 0, LazyVim.root.get(), "float")
        end,
        desc = "ToggleTerm (float root_dir)",
      },
      {
        "<leader>th",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, 15, LazyVim.root.get(), "horizontal")
        end,
        desc = "ToggleTerm (horizontal root_dir)",
      },
      {
        "<leader>tv",
        function()
          local count = vim.v.count1
          require("toggleterm").toggle(count, vim.o.columns * 0.4, LazyVim.root.get(), "vertical")
        end,
        desc = "ToggleTerm (vertical root_dir)",
      },
      {
        "<leader>tn",
        "<cmd>ToggleTermSetName<cr>",
        desc = "Set term name",
      },
      {
        "<leader>ts",
        "<cmd>TermSelect<cr>",
        desc = "Select term",
      },
      {
        "<leader>tt",
        function()
          require("toggleterm").toggle(1, 100, LazyVim.root.get(), "tab")
        end,
        desc = "ToggleTerm (tab root_dir)",
      },
      {
        "<leader>TT",
        function()
          require("toggleterm").toggle(1, 100, vim.loop.cwd(), "tab")
        end,
        desc = "ToggleTerm (tab cwd_dir)",
      },
    },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = [[<c-\>]],
      hide_numbers = true,
      shade_filetypes = {},
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      direction = "horizontal" or "vertical" or "window" or "float",
      close_on_exit = true,
    },
  },
}
