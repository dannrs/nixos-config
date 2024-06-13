{ pkgs, ... }:

let
  new-note = import ./scripts/new-note.nix { inherit pkgs; };
in 
{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    new-note
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
    glibc
    zig
    lua
    stylua
    luajitPackages.luarocks
    lazygit

    nodejs_20
    bun
    turso-cli

    # cli tools
    ntfs3g
    brightnessctl
    htop
    playerctl
    fd
    ripgrep

    heroic
    gnome.file-roller
   ];

   programs = {
    appimage.enable = true;
  };
}
