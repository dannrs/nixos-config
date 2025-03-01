-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.som/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local options = {
  encoding = "utf-8",
  fileencoding = "utf-8",
  title = true,
  autoindent = true,
  hlsearch = true,
  backup = false,
  swapfile = false,
  writebackup = false,
  showcmd = false,
  cmdheight = 0,
  laststatus = 0,
  scrolloff = 10,
  inccommand = "split",
  smarttab = true,
  breakindent = true,
  backspace = { "start", "eol", "indent" },
  splitkeep = "cursor",
  hidden = true,
  pumheight = 10,
  wrap = true,
}

for option, value in pairs(options) do
  vim.opt[option] = value
end

vim.scriptencoding = "utf-8"
vim.opt.path:append({ "**" })
vim.opt.wildignore:append({ "*/node_modules/*" })

-- Add asterisks in block comments
vim.opt.formatoptions:append({ "r" })
