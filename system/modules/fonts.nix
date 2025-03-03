{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      inter
      jetbrains-mono
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      twemoji-color-font
      font-awesome
      powerline-symbols
      nerd-fonts.symbols-only
      nerd-fonts.jetbrains-mono
    ];

    fontconfig.defaultFonts = let
      addAll = builtins.mapAttrs (k: v: ["Symbols Nerd Font"] ++ v ++ ["Noto Color Emoji"]);
    in
      addAll {
        serif = ["Inter Display"];
        sansSerif = ["Inter Display"];
        monospace = ["JetBrains Mono"];
        emoji = [];
      };
  };
}
