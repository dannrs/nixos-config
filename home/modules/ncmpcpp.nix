{
  config,
  pkgs,
  ...
}: let
  musicDir = "/run/media/dann/782ED1DD2ED1950A/Music/";
  homeDir = "${config.home.homeDirectory}";
in {
  services.mpd = {
    enable = true;
    network = {
      listenAddress = "127.0.0.1";
      port = 6600;
      startWhenNeeded = true;
    };
    musicDirectory = musicDir;
    playlistDirectory = "${homeDir}/.config/mpd/playlists";
    dbFile = "${homeDir}/.config/mpd/mpd.db";
    extraConfig = ''
      log_file "${homeDir}/.config/mpd/mpd.log"
      pid_file "${homeDir}/.config/mpd/mpd.pid"
      state_file "${homeDir}/.config/mpd/mpdstate"

      auto_update "yes"
      restore_paused "yes"

      audio_output {
        type    "pipewire"
        name    "PipeWire Sound Server"
      }

      audio_output {
        type    "fifo"
        name    "Visualizer feed"
        path    "/tmp/mpd.fifo"
        format  "44100:16:2"
      }
    '';
  };

  programs.ncmpcpp = {
    enable = true;
    package = pkgs.ncmpcpp.override {
      visualizerSupport = true;
      clockSupport = true;
      taglibSupport = true;
    };
    mpdMusicDir = musicDir;
    settings = {
      # ncmpcpp confnig by namishh
      # https://github.com/namishh/crystal/blob/main/home/namish/conf/music/ncmp/default.nix

      # Miscelaneous
      ncmpcpp_directory = "${homeDir}/.config/ncmpcpp";
      ignore_leading_the = true;
      external_editor = "nvim";
      message_delay_time = 1;
      playlist_disable_highlight_delay = 2;
      autocenter_mode = "yes";
      centered_cursor = "yes";
      allow_for_physical_item_deletion = "no";
      lines_scrolled = "1";
      follow_now_playing_lyrics = "yes";
      lyrics_fetchers = "genius";

      # visualizer
      visualizer_data_source = "/tmp/mpd.fifo";
      visualizer_output_name = "mpd_visualizer";
      visualizer_type = "ellipse";
      visualizer_look = "●▮";
      # visualizer_type = "spectrum";
      # visualizer_look = "▋▋";
      visualizer_color = "blue, green";

      # appearance
      colors_enabled = "yes";
      playlist_display_mode = "classic";
      user_interface = "classic";
      browser_display_mode = "columns";
      search_engine_display_mode = "columns";
      playlist_editor_display_mode = "columns";
      volume_color = "white";

      # window
      song_window_title_format = "{%a} - {%t}";
      statusbar_visibility = "no";
      header_visibility = "no";
      titles_visibility = "no";

      # progress bar
      progressbar_look = "▃▃▃";
      progressbar_color = "black";
      progressbar_elapsed_color = "blue";

      # song list
      # song_status_format = "$7%t";
      # song_list_format = "$(008)%t$R  $(247)%a$R$5  %l$8";
      # song_columns_list_format = "(53)[blue]{tr} (45)[blue]{a}";
      song_status_format = "$b$7♫ $2%a $4⟫$3⟫ $8%t $4⟫$3⟫ $5%b ";
      song_list_format = " $7%l  $2%t $R$5%a ";
      song_columns_list_format = "(6)[]{} (23)[red]{a} (26)[yellow]{t|f} (40)[green]{b} (4)[blue]{l}";

      current_item_prefix = "$b$8";
      current_item_suffix = "$/b$8";

      # now_playing_prefix = "$b$5| ";
      # now_playing_suffix = "$/b$5";
      now_playing_prefix = "$b";
      now_playing_suffix = "$8$/b";

      # song_library_format = "{{%a - %t} (%b)}|{%f}";

      # colors
      main_window_color = "blue";

      current_item_inactive_column_prefix = "$b$5";
      current_item_inactive_column_suffix = "$/b$5";

      color1 = "white";
      color2 = "blue";
    };
  };
}
