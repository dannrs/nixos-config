{pkgs, ...}: {
  boot = {
    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ext4" "ntfs"];
    };

    kernelPackages = pkgs.linuxPackages_latest;

    consoleLogLevel = 3;
    kernelParams = [
      "quiet"
      "systemd.show_status=auto"
      "rd.udev.log_level=3"
      "modules_blacklist=ntfs3"
    ];

    loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        efiSupport = true;
        useOSProber = true;
        devices = ["nodev"];
      };
    };

    plymouth.enable = true;
  };
}
