{
  config,
  pkgs,
  lib,
  ...
}: let
  inherit
    (config.lib.stylix.colors.withHashtag)
    base01
    base08
    base09
    base0E
    ;
  bgImageSection = name: ''
    #${name} {
      background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/${name}.png"));
    }
  '';
in {
  programs.wlogout = {
    enable = true;
    layout = [
      {
        label = "lock";
        action = "hyprlock";
        text = "Lock";
        keybind = "l";
      }
      {
        label = "logout";
        action = "hyprctl dispatch exit";
        text = "Logout";
        keybind = "e";
      }
      {
        label = "shutdown";
        action = "systemctl poweroff";
        text = "Shutdown";
        keybind = "s";
      }
      {
        label = "suspend";
        action = "systemctl suspend";
        text = "Suspend";
        keybind = "u";
      }
      {
        label = "reboot";
        action = "systemctl reboot";
        text = "Reboot";
        keybind = "r";
      }
    ];
    style = ''
      * {
        background: none;
        font-size: 16px;
      }

      window {
        background-color: rgba(0, 0, 0, .5);
      }

      button {
        color: ${base08};
        background: alpha(${base01}, 0.8);
        outline-style: none;
        border: none;
        border-radius: 0px;
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
        box-shadow: none;
        text-shadow: none;
      }

      button:hover, button:focus {
        background-color: alpha(${base0E}, 0.8);
        background-size: 30%;
        animation: gradient_f 20s ease-in infinite;
        transition: all 0.3s cubic-bezier(.55,0.0,.28,1.682);
      }

      button:hover#lock, button:focus#lock {
        border-radius: 18px;
        margin : 10px 0px 10px 20px;
      }

      button:hover#logout, button:focus#logout {
        border-radius: 18px;
        margin : 10px 0px 10px 0px;
      }

      button:hover#shutdown, button:focus#shutdown {
        border-radius: 18px;
        margin : 10px 0px 10px 0px;
      }

      button:hover#suspend, button:focus#suspend {
        border-radius: 18px;
        margin : 10px 0px 10px 0px;
      }

      button:hover#reboot, button:focus#reboot {
        border-radius: 18px;
        margin : 10px 20px 10px 0px;
      }

      ${lib.concatMapStringsSep "\n" bgImageSection [
        "lock"
        "logout"
        "shutdown"
        "suspend"
        "reboot"
      ]}

      #lock {
        border-radius: 18px 0px 0px 18px;
        margin : 20px 0px 20px 20px;
      }

      #logout{
        margin : 20px 0px 20px 0px;
      }

      #shutdown {
        margin : 20px 0px 20px 0px;
      }

      #suspend {
        margin : 20px 0px 20px 0px;
      }

      #reboot {
        border-radius: 0px 18px 18px 0px;
        margin : 20px 20px 20px 0px;
      }
    '';
  };
}
