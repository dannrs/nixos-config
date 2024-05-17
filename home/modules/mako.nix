{ config, ... }:

let theme = config.colorScheme.palette;
  in {
    services.mako = {
      enable = true;
      anchor = "top-right";
      backgroundColor = "#${theme.base02}";
      textColor = "#${theme.base08}";
      margin = "8";
      padding = "10";
      borderSize = 0;
      borderRadius = 0;
      defaultTimeout = 5000;
      font = "SF Pro Display Regular 10";
      layer = "overlay";
      sort = "-time";
    };
  }
