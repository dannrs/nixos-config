{...}: {
  services.mako = {
    enable = true;
    settings = {
      margin = "8";
      padding = "10";
      borderSize = 0;
      borderRadius = 0;
      defaultTimeout = 5000;
      layer = "overlay";
      sort = "-time";
      anchor = "top-right";
    };
  };
}
