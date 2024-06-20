{ config, ... }:
let
  theme = config.colorScheme.palette;
in {
  # Hyprland
  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

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
      ];

      debug = {
        disable_logs = false;
        enable_stdout_logs = true;
      };

      input = {
        kb_layout = "us";
        # kb_variant = "lang";
        # kb_options = "grp:caps_toggle";

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
        "col.active_border" = "rgba(${theme.base0E}FF) rgba(${theme.base09}FF) 45deg";
        "col.inactive_border" = "rgba(${theme.base04}4D)";

        layout = "dwindle";
      };

      decoration = {
        rounding = 0;
        drop_shadow = false;
        blur = {
          enabled = true;
          size = 5;
          passes = 3;
          ignore_opacity = true;
        };
      };

      animations = {
        enabled = true;

        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
        ];

        animation = [
          "windows,     1, 7,  wind"
          "windowsOut,  1, 7,  default, popin 80%"
          "border,      1, 10, default"
          "borderangle, 1, 8,  default"
          "fade,        1, 7,  default"
          "workspaces,  1, 6,  default"
        ];
      };

      dwindle = {
        pseudotile = true; # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true; # you probably want this
      };

      master = {
        new_is_master = true;
      };

      gestures = {
        workspace_swipe = true;
        workspace_swipe_fingers = 3;
        workspace_swipe_invert = false;
        workspace_swipe_distance = 200;
        workspace_swipe_forever = true;
      };

      misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        enable_swallow = true;
        render_ahead_of_time = false;
        disable_hyprland_logo = true;
      };

      windowrule = [
        "maximize, ^(imv)$"
        "float, ^(mpv)$"
      ];

      windowrulev2 = [
        "workspace 3 silent, class:(obsidian)"
        "workspace 9 silent, class:(discord)"
        "workspace 10 silent, class:(Spotify)"
      ];

      exec-once = [
        "waybar"
        "xsetroot -cursor_name left_ptr"
        "wl-paste --type text --watch cliphist store"
        "wl-paste --type image --watch cliphist store"
        "[workspace 3 silent] obsidian"
        "[workspace 9 silent] flatpak run com.discordapp.Discord"
      ];

      bind = [
        "$mainMod, V, exec, cliphist list | wofi --dmenu | cliphist decode | wl-copy"
        "$mainMod, Return, exec, foot"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, M, exit,"
        "$mainMod, E, exec, pcmanfm"
        "$mainMod, F, fullscreen"
        "$mainMod, M, fullscreen,1"
        "$mainMod SHIFT, F, togglefloating"
        "$mainMod, D, exec, rofi -show drun"
        "$mainMod, P, pseudo, # dwindle"
        "$mainMod, S, togglesplit, # dwindle"

        "$mainMod, Escape, exec, hyprlock"
        ", Print, exec, screenshot"

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
        '', Print, exec, grim -g "$(slurp)" - | swappy -f -''

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

  # Hyprlock
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        no_fade_in = false;
        grace = 0;
      };
      background = [
        {
          monitor = "";
          path = "/home/dann/pictures/wallpapers/1.jpg";
          blur_size = 5;
          blur_passes = 3;
          noise = "0.0117";
          contrast = "0.8916";
          brightness = "0.8172";
          vibrancy = "0.1696";
          vibrancy_darkness = "0.0";
        }
      ];
      input-field = [
        {
          monitor = "";
          size = "280, 35";
          outline_thickness = 2;
          dots_size = "0.2";
          dots_spacing = "0.2";
          dots_center = true;
          outer_color = "rgba(0, 0, 0, 0)";
          inner_color = "rgba(0, 0, 0, 0.5)";
          font_color = "rgb(200, 200, 200)";
          fade_on_empty = false;
          font_family = "Inter Display Light";
          placeholder_text = "<i><span foreground='##cdd6f4'>Input Password...</span></i>";
          hide_input = false;
          position = "0, -140";
          halign = "center";
          valign = "center";
        }
      ];
      label = [
        { 
          monitor = "";
          text = "$TIME";
          color = "rgba(255, 255, 255, 0.6)";
          font_size = 60;
          font_family = "Inter ExtraBold";
          position = "0, -280";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = ''
            cmd[update:1000] echo "$(date +"%d %B %Y")"
          '';
          color = "rgba(255, 255, 255, 0.6)";
          font_size = 14;
          font_family = "Inter Display Medium";
          position = "0, -370";
          halign = "center";
          valign = "top";
        }
        {
          monitor = "";
          text = "Hi there, $USER 👋";
          color = "rgba(255, 255, 255, 0.6)";
          font_size = 12;
          font_family = "Inter Display Medium";
          position = "0, -95";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };

  # Hypridle
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
      };

      listener = [
        {
          timeout = 180;
          on-timeout = "brightnessctl -s set 10";
          on-resume = "brightnessctl -r";
        }
        {
          timeout = 480;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 1200;
          on-timeout = "hyprctl dispatch dpms off";
          on-resume = "hyprctl dispatch dpms on";
        }
        {
          timeout = 1800;
          on-timeout = "systemctl suspend";
        }
      ];
    };
  };

  # Hyprpaper
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "off";
      splash = false;
      preload = [
        "/home/dann/pictures/wallpapers/1.jpg"
      ];
      wallpaper = [
        "eDP-1, /home/dann/pictures/wallpapers/1.jpg"
      ];
    };
  };
}
