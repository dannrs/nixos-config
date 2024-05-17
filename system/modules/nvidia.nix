{
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    prime = {
       sync.enable = true;
       intelBusId = "PCI:00:02:0";
       nvidiaBusId = "PCI:01:00:0";
    };
  };
}
