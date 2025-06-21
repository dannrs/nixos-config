{
  config,
  lib,
  pkgs,
  ...
}: let
  inherit
    (config.lib.stylix.colors.withHashtag)
    base00
    base01
    base02
    base03
    base04
    base08
    base0B
    base0E
    base0F
    ;

  now-playing = pkgs.writeShellScript "now-playing" ''
    playerctl=${pkgs.playerctl}
    PLAYER_STATUS=$(playerctl status -p spotify 2>/dev/null)

    if [[ "$PLAYER_STATUS" == "Playing" || "$PLAYER_STATUS" == "Paused" ]]; then
      ARTIST=$(playerctl metadata artist)
      TITLE=$(playerctl metadata title)

      if [[ -n "$ARTIST" && -n "$TITLE" ]]; then
        echo "$ARTIST - $TITLE"
      else
        echo "No track playing"
      fi
    else
      echo " "
    fi
  '';
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "5 5 0 5";

        modules-left = ["custom/logo" "hyprland/workspaces" "hyprland/window"];
        modules-right = ["network" "pulseaudio" "backlight" "battery" "clock" "tray" "custom/power-menu"];

        "hyprland/workspaces" = {
          disable-scroll = true;
        };

        "hyprland/window" = {
          max-length = 30;
          separate-outputs = false;
        };

        "clock" = {
          # timezone = "America/New_York";
          format = "{:%H:%M  %a}";
          tooltip = true;
          tooltip-format = "<big>{:%A, %d %B %Y }</big>\n<tt><small>{calendar}</small></tt>";
        };

        "network" = {
          interval = 1;
          format-icons = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
          format-ethernet = "{icon} {bandwidthDownBytes}  {bandwidthUpBytes} ";
          format-wifi = "{icon} {bandwidthDownBytes}   {bandwidthUpBytes} ";
          format-disconnected = "󰤭";
          tooltip = false;
          max-length = 30;
        };

        "pulseaudio" = {
          # scroll-step = 1; # %, can be a float
          reverse-scrolling = 1;
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = " {icon} {format_source}";
          format-muted = " {format_source}";
          format-icons = {
            headphone = "";
            hands-free = "";
            headset = "";
            phone = "";
            portable = "";
            car = "";
            default = ["" "" ""];
          };
          on-click = "pavucontrol";
        };

        "backlight" = {
          device = "intel_backlight";
          format = "{percent}% {icon}";
          format-icons = ["󰃠"];
        };

        battery = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% ";
          format-plugged = "{capacity}% ";
          format-alt = "{time} {icon}";
          format-icons = ["" "" "" "" "" "" "" "" "" ""];
          on-update = "$HOME/.config/waybar/scripts/check_battery.sh";
        };

        tray = {
          icon-size = 14;
          spacing = 4;
        };

        "custom/logo" = {
          format = "";
          tooltip = false;
          on-click = "rofi -show drun";
        };

        "custom/power-menu" = {
          format = "";
          tooltip = false;
          on-click = "wlogout -b 5 -c 0 r 0 -p layer-shell";
        };

        "custom/now-playing" = {
          format = "  {text}";
          interval = 30;
          max-length = 30;
          tooltip = false;
          on-click = "playerctl play-pause";
          escape = true;
          exec = now-playing.outPath;
          exec-if = "pgrep spotify";
        };
      };
    };

    style = lib.mkForce ''
      * {
          border: none;
          border-radius: 0;
          /* `otf-font-awesome` is required to be installed for icons */
          font-family: Inter Display;
          font-weight: 600;
          min-height: 15px;
      }

      window#waybar {
          background: alpha(${base00}, 0.95);
          color: ${base04};
          border-radius: 18px;
      }

      window#waybar.hidden {
          opacity: 0;
      }

      window#waybar.empty #window {
          background: transparent;
      }

      tooltip {
        background: ${base02};
      	border: 0px solid ${base0E};
      	border-radius: 12px;
      }

      tooltip label {
      	color: ${base08};
      }

      #workspaces {
          margin: 5px 8px;
          border-radius: 18px;
          transition: none;
          background: ${base02};
      }

      #workspaces button {
          transition: none;
          color: ${base04};
          background: transparent;
          padding: 5px 7px;
          font-size: 13px;
      }

      #workspaces button.persistent {
          color: ${base04};
          font-size: 13px;
      }

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      #workspaces button:hover {
          transition: none;
          box-shadow: inherit;
          text-shadow: inherit;
          border-radius: inherit;
          color: ${base02};
          background: ${base04};
      }

      #workspaces button.active {
          background: ${base03};
          color: ${base08};
          border-radius: inherit;
      }

      #custom-logo {
        margin-left: 10px;
        font-size: 16px;
        color: ${base08};
      }

      #custom-power-menu {
        margin-right: 10px;
        font-size: 14px;
        color: ${base08};
      }

      #custom-now-playing {
          padding: 0px 10px;
          margin: 5px 8px 5px 0px;
          border-radius: 15px;
          transition: none;
          color: ${base08};
          background: ${base02};
          font-size: 13px;
      }

      #window {
          padding: 0px 10px;
          margin-right: 8px;
          background-color: transparent;
          color: ${base08};
          font-size: 14px;
      }

      #clock {
          padding: 0px 10px;
          margin: 5px 8px 5px 0px;
          border-radius: 15px;
          transition: none;
          color: ${base08};
          background: ${base02};
          font-size: 13px;
      }

      #pulseaudio {
          padding: 0px 10px;
          margin: 5px 8px 5px 0px;
          border-radius: 15px;
          transition: none;
          color: ${base08};
          background: ${base02};
          font-size: 13px;
      }

      #network {
          padding: 0px 10px;
          margin: 5px 8px 5px 0px;
          border-radius: 15px;
          transition: none;
          color: ${base08};
          background: ${base02};
          font-size: 13px;
      }

      #pulseaudio.muted {
          background-color: ${base08};
          color: ${base01};
      }

      #backlight {
          padding: 0px 10px;
          margin: 5px 8px 5px 0px;
          border-radius: 15px;
          transition: none;
          color: ${base08};
          background: ${base02};
          font-size: 13px;
      }

      #battery {
          padding: 0px 10px;
          margin: 5px 8px 5px 0px;
          border-radius: 15px;
          transition: none;
          color: ${base08};
          background: ${base02};
          font-size: 13px;
      }

      #battery.charging {
          color: ${base00};
          background-color: ${base0B};
      }

      #battery.warning:not(.charging) {
          background-color: ${base0B};
          color: ${base00};
      }

      #battery.critical:not(.charging) {
          background-color: ${base0F};
          color: ${base00};
          animation-name: blink;
          animation-duration: 0.5s;
          animation-timing-function: linear;
          animation-iteration-count: infinite;
          animation-direction: alternate;
      }

      #tray {
          margin: 5px 0px;
          padding: 0px 5px;
          transition: none;
          color: ${base08};
          background: transparent;
          font-size: 13px;
      }

      @keyframes blink {
          to {
              background-color: ${base08};
              color: ${base02};
          }
      }
    '';
  };
}
