{pkgs, ...}: let
  opacity = 0.95;
  fontSize = 11;
in {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    # image = pkgs.fetchurl {
    #   url = "https =//www.pixelstalk.net/wp-content/uploads/2016/05/Epic-Anime-Awesome-Wallpapers.jpg";
    #   hash = "sha256-enQo3wqhgf0FEPHj2coOCvo7DuZv+x5rL/WIo4qPI50=";
    # };
    #image = ./../../../pictures/wallpapers/3.jpg;
    # polarity = "dark";
    opacity = {
      terminal = opacity;
      popups = opacity;
    };
    fonts = {
      sizes = {
        applications = fontSize;
        desktop = fontSize;
        popups = fontSize;
        terminal = 10;
      };
      serif = {
        package = pkgs.inter;
        name = "Inter Display";
      };
      sansSerif = {
        package = pkgs.inter;
        name = "Inter Display";
      };
      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrains Mono";
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
    cursor = {
      package = pkgs.simp1e-cursors;
      name = "Simp1e";
      size = 16;
    };
    targets = {
      qt.enable = false;
      hyprlock.enable = false;
      neovim.enable = false;
      waybar.enable = false;
      rofi.enable = false;
    };
  };
}
