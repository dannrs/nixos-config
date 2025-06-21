{pkgs, ...}: {
  # Sound
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;

  # Printing
  services.printing = {
    enable = true;
    drivers = with pkgs; [gutenprint epson-escpr];
  };

  # Docker
  virtualisation.docker = {
    enable = true;
    package = pkgs.docker.override {
      initSupport = true;
    };
    storageDriver = "btrfs";
  };

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal
    ];
    configPackages = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-hyprland
      xdg-desktop-portal
    ];
  };

  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.gnome.gnome-keyring.enable = true;
  services.libinput.enable = true;

  # MySQL
  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  security.pam.services.hyprlock = {
    text = ''
      auth include login
    '';
  };
}
