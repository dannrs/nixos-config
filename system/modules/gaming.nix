{ pkgs, ... }:

{
  programs = { 
    steam = {
      enable = true;
      gamescopeSession.enable = true;
    };
    gamemode.enable = true;
  };

  environment = {
    systemPackages = with pkgs; [
      mangohud protonup
    ];
    sessionVariables = {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/dann/.steam/root/compatibilitytools.d";
    };
  };
}
