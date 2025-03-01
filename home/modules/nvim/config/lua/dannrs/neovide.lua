if vim.g.neovide then
  vim.o.guifont = "JetBrains_Mono,Symbols_Nerd_Font:h10.5"
  vim.o.linespace = 2

  -- Emulate the Alacritty font rendering
  vim.g.neovide_text_gamma = 0.8
  vim.g.neovide_text_contrast = 0.1

  vim.g.neovide_transparency = 0.85

  -- Floating window and popup-menu transparency
  vim.o.winblend = 30
  vim.o.pumblend = 30

  vim.g.neovide_padding_top = 4
  vim.g.neovide_padding_bottom = 3
  vim.g.neovide_padding_right = 3
  vim.g.neovide_padding_left = 4

  -- Disable cursor animation
  vim.g.neovide_cursor_animation_length = 0
  vim.g.neovide_cursor_trail_length = 0
end
