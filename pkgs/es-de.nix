{pkgs, ...}: let
  pname = "es_de";
  version = "3.1.1";
  src = pkgs.fetchurl {
    url = "https://gitlab.com/es-de/emulationstation-de/-/package_files/164503027/download";
    hash = "sha256-TvGABOpO/PWtcK+MogyMCS39T47Hz1+bv3Dz2yM284Q=";
  };
  appimageContents = pkgs.appimageTools.extract {inherit pname version src;};
in
  pkgs.appimageTools.wrapType2 {
    inherit pname version src;
    pkgs = pkgs;

    extraInstallCommands = ''
      install -m 444 -D ${appimageContents}/org.${pname}.frontend.desktop -t $out/share/applications
      substituteInPlace $out/share/applications/org.${pname}.frontend.desktop --replace 'Exec=es-de' 'Exec=${pname}'
      cp -r ${appimageContents}/usr/share/icons $out/share
    '';
  }
