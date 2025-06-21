{
  config,
  pkgs,
  ...
}: {
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [rocmPackages.clr];
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.nvidia = {
    package = config.boot.kernelPackages.nvidiaPackages.production;
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };
}
