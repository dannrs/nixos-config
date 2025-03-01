return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  event = "VeryLazy",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    workspaces = {
      {
        name = "notes",
        path = "~/documents/notes",
      },
    },
    notes_subdir = "0_inbox",
    new_notes_location = "notes_subdir",
    note_id_func = function(title)
      local suffix = ""
      if title ~= nil then
        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        for _ = 1, 4 do
          suffix = suffix .. string.char(math.random(65, 90))
        end
      end
      return tostring(os.time()) .. "-" .. suffix
    end,
    note_path_func = function(spec)
      local path = spec.dir / tostring(spec.title)
      return path:with_suffix(".md")
    end,
  },
  keys = {
    {
      "<leader>nn",
      "<cmd>ObsidianNew<cr>",
      desc = "Obsidian New Note",
    },
  },
}
