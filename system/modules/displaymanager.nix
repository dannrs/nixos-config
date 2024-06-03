{ gtkThemeFromScheme, ... }:

{
  programs.regreet = {
    enable = true;
    settings = {
      GTK = {
        application_prefer_dark_theme = true;
        cusor_theme_name = "Simp1e";
        font_name = "Inter Display 12";
        icon_theme_name = "Papirus-Dark";
        theme_name = "tokyo-night-dark";
      };
      commands = {
        reboot = [ "systemctl" "reboot" ];
        poweroff = [ "systemctl" "poweroff" ];
      };
    };
  };

  services.libinput.enable = true;
}
