{
  pkgs,
  config,
  lib,
  ...
}: {
  services.greetd = let
    session = {
      command = "${lib.getExe config.programs.uwsm.package} start hyprland-uwsm.desktop";
      user = "dann";
    };
  in {
    enable = true;
    settings = {
      terminal.vt = 1;
      default_session = session;
      initial_session = session;
    };
  };

  # programs.regreet = {
  #   enable = true;
  #   settings = {
  #     commands = {
  #       reboot = ["systemctl" "reboot"];
  #       poweroff = ["systemctl" "poweroff"];
  #     };
  #   };
  # };

  # services.displayManager.sddm.enable = true;

  programs.uwsm = {
    enable = true;
    waylandCompositors.hyprland = {
      binPath = "/run/current-system/sw/bin/Hyprland";
      prettyName = "Hyprland";
      comment = "Hyprland compositor managed by UWSM";
    };
  };
}
