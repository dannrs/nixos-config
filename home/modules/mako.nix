{
  config,
  lib,
  ...
}: let
  inherit
    (config.lib.stylix.colors.withHashtag)
    base08
    ;
in {
  services.mako = {
    enable = true;
    anchor = "top-right";
    margin = "8";
    padding = "10";
    borderSize = 0;
    borderRadius = 0;
    defaultTimeout = 5000;
    layer = "overlay";
    sort = "-time";
    extraConfig = lib.mkForce ''
      [urgency=low]
      text-color=${base08}
    '';
  };
}
