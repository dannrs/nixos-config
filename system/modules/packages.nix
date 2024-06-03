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
     libnotify

     unzip
     zip
     p7zip
     undmg

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
     ntfs3g
     brightnessctl
     htop
     playerctl
     fd
     ripgrep
     zoxide

     heroic
     gnome.file-roller
   ];

   programs = {
    appimage.enable = true;
  };
}
