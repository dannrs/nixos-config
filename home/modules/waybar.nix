{ config, ... }:

let theme = config.colorScheme.palette;
in {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin = "5 5 0 5";

        modules-left = [ "hyprland/workspaces" "hyprland/window" ];
        modules-right = [ "network" "pulseaudio" "backlight" "battery" "clock" "tray"];

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
      format-disconnected = "󰤮";
      tooltip = false;
      max-length = 30;
    };

    "pulseaudio" = {
        # scroll-step = 1; # %, can be a float
        reverse-scrolling = 1;
        format = "{volume}% {icon}  {format_source}";
        format-bluetooth = "{volume}% {icon} {format_source}";
        format-bluetooth-muted = " {icon} {format_source}";
        format-muted = " {format_source}";
        format-source = "{volume}% ";
        format-source-muted = "";
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
        format-icons = [""];
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
        icon-size = 16;
        spacing = 4;
    };

      };
    };
  
    style = 
      ''
* {
    border: none;
    border-radius: 0;
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: Inter Display;
    font-weight: 600; 
    min-height: 15px;
}

window#waybar {
    background: transparent;
}

window#waybar.hidden {
    opacity: 0;
}

window#waybar.empty #window {
    background: transparent;
}

tooltip {
  background: #${theme.base02};
	border: 0px solid #${theme.base0E};
	border-radius: 12px;
}

tooltip label {
	color: #${theme.base08};
}

#workspaces {
    margin-right: 8px;
    border-radius: 15px;
    transition: none;
    background: #${theme.base02};
}

#workspaces button {
    transition: none;
    color: #${theme.base04};
    background: transparent;
    padding: 5px;
    font-size: 13px;
}

#workspaces button.persistent {
    color: #${theme.base04};
    font-size: 13px;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    border-radius: inherit;
    color: #${theme.base02};
    background: #${theme.base04};
}

#workspaces button.active {
    background: #${theme.base03};
    color: #${theme.base08};
    border-radius: inherit;
}

#window {
    padding: 0px 10px;
    color: #${theme.base08};
    background: #${theme.base02};
    border-radius: 12px;
    font-size: 14px;
}

#clock {
    padding: 0px 10px;
    border-radius: 12px;
    transition: none;
    color: #${theme.base08};
    background: #${theme.base02};
    font-size: 13px;
}

#pulseaudio {
    margin-right: 8px;
    padding: 0px 10px;
    border-radius: 12px;
    transition: none;
    color: #${theme.base08};
    background: #${theme.base02};
    font-size: 13px;
}

#network {
    margin-right: 8px;
    padding: 0px 10px;
    border-radius: 12px;
    transition: none;
    color: #${theme.base08};
    background: #${theme.base02};
    font-size: 13px;
}

#pulseaudio.muted {
    background-color: #${theme.base08};
    color: #${theme.base01};
}

#backlight {
    margin-right: 8px;
    padding: 0px 10px;
    border-radius: 12px;
    transition: none;
    color: #${theme.base08};
    background: #${theme.base02};
    font-size: 13px;
}

#battery {
    margin-right: 8px;
    padding: 0px 10px;
    border-radius: 12px;
    transition: none;
    color: #${theme.base08};
    background: #${theme.base02};
    font-size: 13px;
}

#battery.charging {
    color: #${theme.base00};
    background-color: #${theme.base0B};
}

#battery.warning:not(.charging) {
    background-color: #${theme.base0B};
    color: #${theme.base00};
}

#battery.critical:not(.charging) {
    background-color: #${theme.base0F};
    color: #${theme.base00};
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#tray {
    margin-left: 8px;
    padding: 0px 10px;
    border-radius: 12px;
    transition: none;
    color: #${theme.base08};
    background: #${theme.base02};
    font-size: 13px;
}

@keyframes blink {
    to {
        background-color: #${theme.base08};
        color: #${theme.base02};
    }
}
      '';
  };
}
