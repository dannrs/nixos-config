{
  lib,
  config,
  ...
}: let
  inherit
    (config.lib.stylix.colors)
    base04
    base09
    base0E
    ;
in {
  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;

    systemd = {
      enable = false;
      variables = ["--all"];
      extraCommands = [
        "systemctl --user stop graphical-session.target"
        "systemctl --user start graphical-session.target"
      ];
    };

    settings = {
      "$mainMod" = "SUPER";

      monitor = ",preferred,auto,1";

      env = [
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_SESSION_DESKTOP,Hyprland"
        # "XCURSOR_SIZE,36"
        "QT_QPA_PLATFORM,wayland"
        "XDG_SCREENSHOTS_DIR,~/pictures/screenshots"
        "WLR_DRM_NO_ATOMIC,1"
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "us";
        # kb_variant = "lang";
        kb_options = "ctrl:nocaps";

        follow_mouse = 1;

        touchpad = {
          natural_scroll = false;
        };

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.
      };

      general = {
        gaps_in = 2;
        gaps_out = 5;
        border_size = 2;
        "col.active_border" = lib.mkForce "rgba(${base0E}FF) rgba(${base09}FF) 45deg";
        "col.inactive_border" = lib.mkForce "rgba(${base04}4D)";
        allow_tearing = true;
        resize_on_border = true;
      };

      decoration = {
        rounding = 0;
        shadow = {
          enabled = false;
        };
        blur = {
          enabled = true;
          brightness = 1.0;
          contrast = 1.0;
          noise = 0.01;

          vibrancy = 0.2;
          vibrancy_darkness = 0.5;

          passes = 4;
          size = 7;

          popups = true;
          popups_ignorealpha = 0.2;
        };
      };

      animations = {
        enabled = true;
        animation = [
          "border, 1, 2, default"
          "fade, 1, 4, default"
          "windows, 1, 3, default, popin 80%"
          "workspaces, 1, 2, default, slide"
        ];
      };

      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      master = {
        new_status = "master";
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_invert = false;
        workspace_swipe_forever = true;
      };

      misc = {
        disable_hyprland_logo = true;
        disable_autoreload = true;
        force_default_wallpaper = 0;
        vrr = 1;
      };

      xwayland.force_zero_scaling = true;

      windowrule = [
        "maximize, class:^(imv)$"
        "float, class:^(mpv)$"
        "fullscreen, class:^(.*.exe)$"
        "fullscreen, class:^(steam_app_.*)$"
        "fullscreen, class:^(steam_proton)$"

        "workspace 3 silent, class:(obsidian)"
        "workspace 9 silent, class:(discord)"
        "workspace 10 silent, class:(Spotify)"
        "immediate, class:^(.*.exe)$"
        "immediate, class:^(steam_app_.*)$"
        "immediate, class:^(steam_proton)$"
      ];

      # layerrule = [
      #   "blur, waybar"
      # ];

      exec-once = [
        "waybar"
        "xsetroot -cursor_name left_ptr"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "[workspace 9 silent] flatpak run com.discordapp.Discord"
      ];

      bind = [
        "$mainMod SHIFT, E, exec, hyprctl dispatch exit"
        "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        "$mainMod, Return, exec, wezterm"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, M, exit,"
        "$mainMod, E, exec, pcmanfm"
        "$mainMod, F, fullscreen"
        "$mainMod, M, fullscreen,1"
        "$mainMod SHIFT, F, togglefloating"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, S, togglesplit, # dwindle"
        "$mainMod, z, exec, wvkbd-mobintl"

        "$mainMod, Escape, exec, hyprlock"
        ", Print, exec, screenshot"
        "$mainMod, G, exec, gaming-mode"

        # Move focus with mainMod + arrow keys
        "$mainMod, H, movefocus, l"
        "$mainMod, L, movefocus, r"
        "$mainMod, K, movefocus, u"
        "$mainMod, J, movefocus, d"

        # Moving windows
        "$mainMod SHIFT, H, swapwindow, l"
        "$mainMod SHIFT, L, swapwindow, r"
        "$mainMod SHIFT, K, swapwindow, u"
        "$mainMod SHIFT, J, swapwindow, d"

        # Window resizing                 X  Y
        "$mainMod CTRL, H, resizeactive, -50 0"
        "$mainMod CTRL, L, resizeactive,  50 0"
        "$mainMod CTRL, K, resizeactive,  0 -50"
        "$mainMod CTRL, J, resizeactive,  0  50"

        # Switch workspaces with mainMod + [0-9]
        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        # Move active window to a workspace with mainMod + SHIFT + [0-9]
        "$mainMod SHIFT, 1, movetoworkspacesilent, 1"
        "$mainMod SHIFT, 2, movetoworkspacesilent, 2"
        "$mainMod SHIFT, 3, movetoworkspacesilent, 3"
        "$mainMod SHIFT, 4, movetoworkspacesilent, 4"
        "$mainMod SHIFT, 5, movetoworkspacesilent, 5"
        "$mainMod SHIFT, 6, movetoworkspacesilent, 6"
        "$mainMod SHIFT, 7, movetoworkspacesilent, 7"
        "$mainMod SHIFT, 8, movetoworkspacesilent, 8"
        "$mainMod SHIFT, 9, movetoworkspacesilent, 9"
        "$mainMod SHIFT, 0, movetoworkspacesilent, 10"

        # Scroll through existing workspaces with mainMod + scroll
        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # Volume and Media Control
        ", XF86AudioRaiseVolume, exec, pamixer -i 5 "
        ", XF86AudioLowerVolume, exec, pamixer -d 5 "
        ", XF86AudioMute, exec, pamixer -t"
        ", XF86AudioMicMute, exec, pamixer --default-source -m"

        # Brightness control
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%- "
        ", XF86MonBrightnessUp, exec, brightnessctl set +5% "

        # Screenshots
        "$mainMod SHIFT, S, exec, grim - | swappy -f -"

        # Waybar
        "$mainMod, B, exec, pkill -SIGUSR1 waybar"
        "$mainMod, W, exec, pkill -SIGUSR2 waybar"
      ];

      # Move/resize windows with mainMod + LMB/RMB and dragging
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
