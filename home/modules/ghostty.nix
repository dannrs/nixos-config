{pkgs, ...}: let
  ghostty-shaders = pkgs.fetchFromGitHub {
    owner = "hackr-sh";
    repo = "ghostty-shaders";
    rev = "3f45815";
    hash = "sha256-N6MP9QX/80ppg+TdmxmMVYsoeguicRIXfPHyoMGt92s=";
  };
in {
  programs.ghostty = {
    enable = true;
    settings = {
      theme = "tokyonight_night";
      font-size = 10.5;
      adjust-cell-height = "30%";
      window-padding-x = 5;
      window-padding-y = 2;
      window-padding-balance = true;
      #background-opacity = 0.90;
      background-blur = true;
      gtk-single-instance = true;
      #custom-shader = "./ghostty-shaders/bettercrt.glsl";
    };
  };

  home.file.".config/ghostty/ghostty-shaders".source = "${ghostty-shaders}";
}
