{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local wezterm = require("wezterm")

      local config = {}

      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      config.color_scheme = 'tokyonight_night'
      config.window_background_opacity = 0.85
      config.window_padding = {
        top = 3,
        bottom = 3,
        left = 5,
        right = 5,
      }

      config.window_content_alignment = {
        horizontal = 'Center',
        vertical = 'Center',
      }

      config.use_fancy_tab_bar = false
      config.hide_tab_bar_if_only_one_tab = true
      config.tab_bar_at_bottom = true
      config.colors = {
        tab_bar = {
          background = 'rgba(22, 22, 30, 0)',
        new_tab = {
          bg_color = 'rgba(22, 22, 30, 1)',
          fg_color = 'rgba(169, 177, 214, 1)',
          },
        },
      }

      config.font = wezterm.font('JetBrains Mono')
      config.font_size = 10.5
      config.line_height = 1.3

      -- config.enable_wayland = false

      return config
    '';
  };
}
