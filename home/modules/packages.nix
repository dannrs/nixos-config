{
  inputs,
  pkgs,
  system,
  ...
}: {
  home.packages = with pkgs; [
    obsidian
    imv
    amberol
    mpv
    grim
    slurp
    swappy
    lutris
    spicetify-cli
    inputs.zen-browser.packages."${system}".default
  ];
}
