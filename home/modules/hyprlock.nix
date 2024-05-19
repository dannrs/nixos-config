{
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
}
