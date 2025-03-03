{
  pkgs,
  lib,
  config,
  ...
}: let
  inherit
    (config.lib.stylix.colors.withHashtag)
    base01
    base02
    base08
    base0B
    base0E
    base0F
    ;
  inherit (config.lib.formats.rasi) mkLiteral;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = lib.mkForce "Inter Display 11";
    location = "center";
    cycle = true;
    extraConfig = {
      modi = "drun,run,filebrowser";
      show-icons = false;
      display-drun = "";
      display-run = "";
      display-filebrowser = "";
      display-window = "";
      drun-display-format = "{name} [<span weight='light' size='small'><i>({generic})</i></span>]";
      window-format = "{w} · {c} · {t}";
    };
    theme = lib.mkForce {
      "*" = {
        background = mkLiteral "${base01}FF";
        background-alt = mkLiteral "${base02}FF";
        foreground = mkLiteral "${base08}FF";
        selected = mkLiteral "${base0E}FF";
        active = mkLiteral "${base0B}FF";
        urgent = mkLiteral "${base0F}FF";
      };

      "*" = {
        border-colour = mkLiteral "var(selected)";
        handle-colour = mkLiteral "var(selected)";
        background-colour = mkLiteral "var(background)";
        foreground-colour = mkLiteral "var(foreground)";
        alternate-background = mkLiteral "var(background-alt)";
        normal-background = mkLiteral "var(background)";
        normal-foreground = mkLiteral "var(foreground)";
        urgent-background = mkLiteral "var(urgent)";
        urgent-foreground = mkLiteral "var(background)";
        active-background = mkLiteral "var(active)";
        active-foreground = mkLiteral "var(background)";
        selected-normal-background = mkLiteral "var(selected)";
        selected-normal-foreground = mkLiteral "var(background)";
        selected-urgent-background = mkLiteral "var(active)";
        selected-urgent-foreground = mkLiteral "var(background)";
        selected-active-background = mkLiteral "var(urgent)";
        selected-active-foreground = mkLiteral "var(background)";
        alternate-normal-background = mkLiteral "var(background)";
        alternate-normal-foreground = mkLiteral "var(foreground)";
        alternate-urgent-background = mkLiteral "var(urgent)";
        alternate-urgent-foreground = mkLiteral "var(background)";
        alternate-active-background = mkLiteral "var(active)";
        alternate-active-foreground = mkLiteral "var(background)";
      };

      /*
      ****----- Main Window -----****
      */
      "window" = {
        /*
        properties for window widget
        */
        transparency = "real";
        location = mkLiteral "center";
        anchor = mkLiteral "center";
        fullscreen = mkLiteral "false";
        width = mkLiteral "600px";
        x-offset = mkLiteral "0px";
        y-offset = mkLiteral "0px";

        /*
        properties for all widgets
        */
        enabled = true;
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@border-colour";
        cursor = "default";
        background-color = mkLiteral "@background-colour";
      };

      /*
      ****----- Main Box -----****
      */
      "mainbox" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px 0px 0px 0px";
        border-color = mkLiteral "@border-colour";
        background-color = mkLiteral "transparent";
        children = map mkLiteral ["inputbar" "message" "listview" "mode-switcher"];
      };

      /*
      ****----- Inputbar -----****
      */
      "inputbar" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "10px";
        border = mkLiteral "0px 0px 1px 0px";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@border-colour";
        background-color = mkLiteral "@alternate-background";
        text-color = mkLiteral "@foreground-colour";
        children = map mkLiteral ["prompt" "entry"];
      };

      "prompt" = {
        enabled = true;
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "textbox-prompt-colon" = {
        enabled = true;
        expand = false;
        str = "::";
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
      };

      "entry" = {
        enabled = true;
        background-color = mkLiteral "inherit";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "text";
        placeholder = "Search...";
        placeholder-color = mkLiteral "inherit";
      };

      /*
      ****----- Listview -----****
      */
      "listview" = {
        enabled = true;
        columns = 1;
        lines = 8;
        cycle = true;
        dynamic = true;
        scrollbar = false;
        layout = mkLiteral "vertical";
        reverse = false;
        fixed-height = true;
        fixed-columns = true;
        spacing = mkLiteral "0px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@border-colour";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground-colour";
        cursor = "default";
      };

      "scrollbar" = {
        handle-width = mkLiteral "5px";
        handle-color = mkLiteral "@handle-colour";
        border-radius = mkLiteral "0px";
        background-color = mkLiteral "@alternate-background";
      };

      /*
      ****----- Elements -----****
      */
      "element" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@border-colour";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground-colour";
        cursor = mkLiteral "pointer";
      };
      "element normal.normal" = {
        background-color = mkLiteral "var(normal-background)";
        text-color = mkLiteral "var(normal-foreground)";
      };
      "element normal.urgent" = {
        background-color = mkLiteral "var(urgent-background)";
        text-color = mkLiteral "var(urgent-foreground)";
      };
      "element normal.active" = {
        background-color = mkLiteral "var(active-background)";
        text-color = mkLiteral "var(active-foreground)";
      };
      "element selected.normal" = {
        background-color = mkLiteral "var(selected-normal-background)";
        text-color = mkLiteral "var(selected-normal-foreground)";
      };
      "element selected.urgent" = {
        background-color = mkLiteral "var(selected-urgent-background)";
        text-color = mkLiteral "var(selected-urgent-foreground)";
      };
      "element selected.active" = {
        background-color = mkLiteral "var(selected-active-background)";
        text-color = mkLiteral "var(selected-active-foreground)";
      };
      "element alternate.normal" = {
        background-color = mkLiteral "var(alternate-normal-background)";
        text-color = mkLiteral "var(alternate-normal-foreground)";
      };
      "element alternate.urgent" = {
        background-color = mkLiteral "var(alternate-urgent-background)";
        text-color = mkLiteral "var(alternate-urgent-foreground)";
      };
      "element alternate.active" = {
        background-color = mkLiteral "var(alternate-active-background)";
        text-color = mkLiteral "var(alternate-active-foreground)";
      };
      "element-icon" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        size = mkLiteral "24px";
        cursor = mkLiteral "inherit";
      };
      "element-text" = {
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "inherit";
        highlight = mkLiteral "inherit";
        cursor = mkLiteral "inherit";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
      };

      /*
      ****----- Mode Switcher -----****
      */
      "mode-switcher" = {
        enabled = true;
        spacing = mkLiteral "10px";
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@border-colour";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground-colour";
      };
      "button" = {
        padding = mkLiteral "10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@border-colour";
        background-color = mkLiteral "@alternate-background";
        text-color = mkLiteral "inherit";
        cursor = mkLiteral "pointer";
      };
      "button selected" = {
        background-color = mkLiteral "var(selected-normal-background)";
        text-color = mkLiteral "var(selected-normal-foreground)";
      };

      /*
      ****----- Message -----****
      */
      "message" = {
        enabled = true;
        margin = mkLiteral "0px";
        padding = mkLiteral "0px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px 0px 0px 0px";
        border-color = mkLiteral "@border-colour";
        background-color = mkLiteral "transparent";
        text-color = mkLiteral "@foreground-colour";
      };
      "textbox" = {
        padding = mkLiteral "10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@border-colour";
        background-color = mkLiteral "@alternate-background";
        text-color = mkLiteral "@foreground-colour";
        vertical-align = mkLiteral "0.5";
        horizontal-align = mkLiteral "0.0";
        highlight = mkLiteral "none";
        placeholder-color = mkLiteral "@foreground-colour";
        blink = true;
        markup = true;
      };
      "error-message" = {
        padding = mkLiteral "10px";
        border = mkLiteral "0px solid";
        border-radius = mkLiteral "0px";
        border-color = mkLiteral "@border-colour";
        background-color = mkLiteral "@background-colour";
        text-color = mkLiteral "@foreground-colour";
      };
    };
  };
}
