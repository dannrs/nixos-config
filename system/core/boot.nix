{pkgs, ...}: {
  boot = {
    initrd = {
      systemd.enable = true;
      supportedFilesystems = ["ext4" "btrfs" "ntfs"];
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
      systemd-boot.enable = true;
    };

    plymouth.enable = true;
  };
}
