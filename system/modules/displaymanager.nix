{
  programs.regreet = {
    enable = true;
    settings = {
      background = {
        path = "$HOME/pictures/wallpapers/1.jpg";
	fit = "Contain";
      };
      commands = {
        reboot = [ "systemctl" "reboot" ];
	poweroff = [ "systemctl" "poweroff" ];
      };
    };
  };

  services.libinput.enable = true;
}
