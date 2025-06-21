{
  programs.spotify-player = {
    enable = true;
    settings = {
      client_id = "d30c878450614e8f9f9c68279eef844c";
      cover_img_scale = 1.8;
      layout = {
        library = {
          album_percent = 30;
        };
      };
      device = {
        volume = 100;
      };
    };
  };
}
