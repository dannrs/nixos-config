{lib, ...}: {
  programs.foot = {
    enable = true;
    settings = {
      main = {
        font = lib.mkDefault "BlexMono Nerd Font:size=10.5:weight=500";
        line-height = 18;
        pad = "5x2 center";
      };

      scrollback = {
        lines = 10000;
        # The scrollbar is glitched on Hyprland
        # https://github.com/hyprwm/Hyprland/issues/5610
        indicator-position = "none";
      };
    };
  };
}
