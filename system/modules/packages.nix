{ pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
     neovim
     pcmanfm
     unzip
     zip
     p7zip
     undmg
     wget
     lshw
     home-manager
     waybar
     wl-clipboard
     xwayland
     firefox
     hyprland
     xdg-desktop-portal-hyprland
     waybar
     mako
     wofi

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
     lazygit
     nodejs_20
     gh
   ];
}
