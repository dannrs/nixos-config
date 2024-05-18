{ pkgs, config, gtkThemeFromScheme, ... }:

{
  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.simp1e-cursors;
    name = "Simp1e";
    size = 16;
  };

  gtk = {
    enable = true;
    font = {
      name = "Inter Display";
      size = 11;
    };
    theme = {
      name = "${config.colorScheme.slug}";
      package = gtkThemeFromScheme { scheme = config.colorScheme; };
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme=1;
    };
  };
  
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
        name = "adwaita-dark";
        package = pkgs.adwaita-qt;
      };
  };
}
