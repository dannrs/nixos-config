{ pkgs, ... }:

{
  home.packages = with pkgs; [
    brave
    obsidian imv mpv
    grim slurp swappy
    zed-editor
    lutris
  ];
}
