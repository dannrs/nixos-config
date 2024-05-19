{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
     neovim
     pcmanfm
     wget
     lshw
     home-manager
     wl-clipboard
     firefox
     xdg-desktop-portal-hyprland

     unzip
     zip
     p7zip
     undmg

     # wallpapers
     swww
     swaybg
     waypaper

     # sound
     pipewire
     wireplumber
     pamixer
     pavucontrol

     polkit_gnome
     font-manager

     # dev
     git
     gh
     rustc
     cargo
     lua
     luajitPackages.luarocks
     lazygit
     nodejs_20

     # cli tools
     playerctl
     fd
     ripgrep
     zoxide
   ];
}
