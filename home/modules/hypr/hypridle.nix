{pkgs, ...}: let
  suspend = pkgs.writeShellScript "suspend-script" ''
    ${pkgs.pipewire}/bin/pw-cli i all 2>&1 | ${pkgs.ripgrep}/bin/rg running -q
    # only suspend if audio isn't running
    if [ $? == 1 ]; then
      ${pkgs.systemd}/bin/systemctl suspend
    fi
  '';
in {
  services.hypridle = {
    enable = false;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "${pkgs.systemd}/bin/loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 300;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 600;
          on-timeout = "${pkgs.systemd}/bin/loginctl lock-session";
        }
        {
          timeout = 1500;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 2700;
          on-timeout = suspend.outPath;
        }
      ];
    };
  };
}
