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
    obs-studio

    gimp

    # gaming
    emulationstation-de
    lutris
    clonehero

    spicetify-cli
    inputs.zen-browser.packages."${system}".twilight

    perl
    miktex

    yt-dlp
    zed-editor
  ];
}
