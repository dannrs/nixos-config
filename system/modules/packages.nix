{
  pkgs,
  inputs,
  outputs,
  ...
}: let
  new-note = import ./scripts/new-note.nix {inherit pkgs;};
  screenshot = import ./scripts/screenshot.nix {inherit pkgs;};
  gaming-mode = import ./scripts/gaming-mode.nix {inherit pkgs;};
  es-de = import ../../pkgs/es-de.nix {inherit pkgs;};
in {
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "freeimage-unstable-2021-11-01"
      ];
    };
    # overlays = [
    #   outputs.overlays.nixpkgs-stable
    #   outputs.overlays.modifications
    #
    #   (final: _: {
    #     libgit2 = pkgs-stable.libgit2;
    #     icu = pkgs-stable.icu;
    #
    #     s2n-tls = pkgs-stable.s2n-tls;
    #     aws-c-io = pkgs-stable.aws-c-io;
    #     aws-c-s3 = pkgs-stable.aws-c-s3;
    #   })
    #
    #   (final: _: {
    #     stable = import inputs.nixpkgs {
    #       inherit (final.stdenv.hostPlatform) system;
    #       inherit (final) config;
    #     };
    #
    #   libgit2 = pkgs.stable.libgit2;
    #   icu = pkgs.stable.icu;
    #   })
    # ];
  };

  environment.systemPackages = with pkgs; [
    #emulationstation-de
    #custom scripts
    new-note
    screenshot
    gaming-mode

    #custom pkgs
    es-de

    #nix related stuffs
    alejandra
    nixd

    pcmanfm
    xfce.thunar
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
    gcc
    lua
    luajitPackages.luarocks
    stylua
    lua-language-server
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
    file-roller
    neovide

    zenity
  ];

  programs.appimage = {
    enable = true;
    binfmt = true;
  };
}
