{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos_small";
        padding = {
          top = 1;
        };
      };

      display = {
        separator = "";
        key.width = 12;
      };

      modules = [
        {
          key = " user";
          type = "title";
          keyColor = "31";
        }
        {
          key = " os";
          type = "os";
          format = "{3}";
          keyColor = "32";
        }
        {
          key = " kernel";
          type = "kernel";
          format = "{2}";
          keyColor = "33";
        }
        {
          key = "󰅐 uptime";
          type = "uptime";
          keyColor = "34";
        }
        {
          key = " wm";
          type = "wm";
          format = "{2}";
          keyColor = "35";
        }
        {
          key = " term";
          type = "terminal";
          format = "{5}";
          keyColor = "36";
        }
        {
          key = " shell";
          type = "shell";
          format = "{3}";
          keyColor = "31";
        }
        {
          key = "󰏖 pkgs";
          type = "packages";
          format = "{1}";
          keyColor = "32";
        }
        {
          key = "󰍛 cpu";
          type = "cpu";
          format = "{1}";
          keyColor = "33";
        }
        {
          key = "󰍛 gpu";
          type = "gpu";
          format = "{1} {2}";
          keyColor = "34";
        }
        {
          key = " memory";
          type = "memory";
          format = "{1} | {2}";
          keyColor = "35";
        }
        {
          key = " colors";
          type = "colors";
          symbol = "circle";
          keyColor = "39";
        }
      ];
    };
  };
}
