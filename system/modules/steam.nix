{pkgs, ...}: {
  programs.steam = {
    enable = true;

    extraCompatPackages = [
      pkgs.proton-ge-bin
    ];

    # gamescopeSession = {
    #   enable = true;
    # };
    package = pkgs.steam.override {
      extraPkgs = pkgs:
        with pkgs; [
          keyutils
          libkrb5
          libpng
          libpulseaudio
          libvorbis
          stdenv.cc.cc.lib
          xorg.libXcursor
          xorg.libXi
          xorg.libXinerama
          xorg.libXScrnSaver
        ];
    };
  };

  environment = {
    systemPackages = with pkgs; [
      mangohud
      gamescope
    ];
  };
}
