{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting

      set -gx PATH $HOME/.npm-global/bin $PATH

      # pnpm
      set -gx PNPM_HOME "/home/danni/.local/share/pnpm"
      if not string match -q -- $PNPM_HOME $PATH
        set -gx PATH "$PNPM_HOME" $PATH
      end
      # pnpm end
    '';

    shellAliases =
      let
        flakeDir = "~/nixos";
      in {
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd = "nix flake update ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
      hms = "home-manager switch --flake ${flakeDir}";

      v = "nvim";
      vf = "nvim (fzf)";

      nx = "cd nixos";
      pr = "cd documents/projects";
      nt = "cd documents/notes";
    };
  };
}
