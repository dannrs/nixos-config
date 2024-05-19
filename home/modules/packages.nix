{ pkgs, ... }:

{
  home.packages = with pkgs; [
    obsidian
   grim slurp swappy
  ];
}
