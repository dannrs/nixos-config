{
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
        format = "{:L%H:%M} 󰥔";
      	tooltip = true;
	tooltip-format = "<big>{:%A, %d.%B %Y }</big><tt><small>{calendar}</small></tt>";
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
        format = "{volume}% {icon} {format_source}";
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
        min-length = 13;
    };

    "backlight" = {
        device = "intel_backlight";
        format = "{percent}% {icon}";
        format-icons = [""];
        min-length = 7;
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
        spacing = 0;
    };

      };
    };
  
    style = 
      ''
* {
    border: none;
    border-radius: 0;
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: JetBrains Mono;
    font-weight: 600; 
    min-height: 10px;
}

window#waybar {
    background: transparent;
}

window#waybar.hidden {
    opacity: 0;
}

window#waybar.empty #window {
    opacity: 0;
}

#workspaces {
    margin-right: 8px;
    border-radius: 10px;
    transition: none;
    background: #383c4a;
}

#workspaces button {
    transition: none;
    color: #7c818c;
    background: transparent;
    padding: 3px;
    font-size: 14px;
}

#workspaces button.persistent {
    color: #7c818c;
    font-size: 14px;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    border-radius: inherit;
    color: #383c4a;
    background: #7c818c;
}

#workspaces button.active {
    background: #4e5263;
    color: white;
    border-radius: inherit;
}

#window {
    padding: 0 10px;
    color: #ffffff;
    background: #383c4a;
    border-radius: 10px;
    font-size: 12px;
}

#clock {
    padding: 0 10px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
    font-size: 12px;
}

#pulseaudio {
    margin-right: 8px;
    padding: 0 10px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
    font-size: 12px;
}

#network {
    margin-right: 8px;
    padding: 0 10px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
    font-size: 12px;
}

#pulseaudio.muted {
    background-color: #90b1b1;
    color: #2a5c45;
}

#backlight {
    margin-right: 8px;
    padding: 0 10px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
    font-size: 12px;
}

#battery {
    margin-right: 8px;
    padding: 0 10px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
    font-size: 12px;
}

#battery.charging {
    color: #ffffff;
    background-color: #26A65B;
}

#battery.warning:not(.charging) {
    background-color: #ffbe61;
    color: black;
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#tray {
    margin-left: 8px;
    padding: 0 10px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
    font-size: 12px;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}
      '';
  };
}
