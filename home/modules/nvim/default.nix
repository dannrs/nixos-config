{
  pkgs,
  config,
  lib,
  ...
}: {
  home.activation.lazyvim = lib.hm.dag.entryAfter ["writeBoundary"] ''
    ${pkgs.rsync}/bin/rsync -avz --chmod=D2755,F744 ${./config}/ ${config.xdg.configHome}/nvim/
  '';

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };
}
