{
  config,
  pkgs,
  inputs,
  system,
  ...
}: {
  imports = [
    inputs.nix-flatpak.homeManagerModules.nix-flatpak
    ./modules
  ];

  home.username = "dann";
  home.homeDirectory = "/home/dann";
  home.stateVersion = "23.11"; # They say don't change it

  programs.git = {
    enable = true;
    userName = "dannrs";
    userEmail = "danniramdhani@proton.me";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # Default image viewer
      "image/jpeg" = ["imv.desktop"];
      "image/png" = ["imv.desktop"];
      "image/gif" = ["imv.desktop"];
      "image/svg+xml" = ["imv.desktop"];
      "image/webp" = ["firefox.desktop"];

      # Default document viewer
      "application/pdf" = ["firefox.desktop"];

      # Default video player
      "video/mp4" = ["mpv.desktop "];
      "video/x-matroska" = ["mpv.desktop "];
      "video/webm" = ["mpv.desktop "];
      "video/quicktime" = ["mpv.desktop "];

      # Default browser
      "x-scheme-handler/http" = ["zen.desktop" "firefox.desktop"];
      "x-scheme-handler/https" = ["zen.desktop" "firefox.desktop"];
    };
  };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/dann/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
