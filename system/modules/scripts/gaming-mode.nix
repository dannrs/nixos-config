{pkgs, ...}:
pkgs.writeShellScriptBin "gaming-mode" ''
  ${pkgs.zenity}/bin/zenity --question --text="Enter gaming mode?" --title="Confirmation"

  if [ $? -eq 0 ]; then
    es_de &
  else
    notify-send "Cancelled."
  fi
''
