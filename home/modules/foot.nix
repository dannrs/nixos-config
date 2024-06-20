{pkgs, ...}: let
  tokyonight_night = (pkgs.fetchurl {
    url = "https://raw.githubusercontent.com/folke/tokyonight.nvim/main/extras/foot/tokyonight_night.ini";
    hash = "sha256-LWMjef09CpvJ1fR/BkjRL0K7ErfvFqa1PntTcTJa7Sg=";
  });
in {
  programs.foot = {
    enable = true;

    settings = {
      main = {
        font = "JetBrains Mono:size=10.5";
        line-height = 18;
        pad = "5x2 center";
        include = "${tokyonight_night}";
      };

      colors = {
        alpha = 0.85;
      };
    };
  };
}
