{ pkgs, ... }:

{
  home.packages = with pkgs; [
   obsidian imv mpv
   grim slurp swappy
   zed-editor
   lutris
  ];
}
