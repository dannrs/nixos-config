{pkgs, ...}: {
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/tokyo-night-storm.yaml";
    targets = {
      plymouth.enable = false;
    };
  };
}
