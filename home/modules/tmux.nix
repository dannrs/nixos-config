{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    prefix = "C-Space";
    baseIndex = 1;
    keyMode = "vi";
    mouse = true;
    clock24 = true;
    shell = "${pkgs.fish}/bin/fish";
    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      yank
    ];
    extraConfig = ''
      set-option -g status-position top
      set-option -sa terminal-overrides ",xterm*:Tc"

      # vim-like pane switching
      bind h select-pane -L
      bind j select-pane -D
      bind k select-pane -U
      bind l select-pane -R

      # Shift-Alt vim keys to switch windows
      bind -n M-H previous-window
      bind -n M-L next-window

      bind v copy-mode
      bind-key -T copy-mode-vi v send-keys -X begin-selection
      bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
      bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel
      bind-key b set-option status
      bind '"' split-window -v -c "#{pane_current_path}"
      bind % split-window -h -c "#{pane_current_path}"

      # Display lazygit
      bind -r g display-popup -d '#{pane_current_path}' -w80% -h80% -E lazygit

      # TokyoNight colors by Folke
      # https://github.com/folke/tokyonight.nvim/tree/main/extras/tmux
      set -g mode-style "fg=#7aa2f7,bg=#3b4261"

      set -g message-style "fg=#7aa2f7,bg=#3b4261"
      set -g message-command-style "fg=#7aa2f7,bg=#3b4261"

      set -g pane-border-style "fg=#3b4261"
      set -g pane-active-border-style "fg=#7aa2f7"

      set -g status "on"
      set -g status-justify "left"

      set -g status-style "fg=#7aa2f7,bg=default"

      set -g status-left-length "100"
      set -g status-right-length "100"

      set -g status-left-style NONE
      set -g status-right-style NONE

      set -g status-left "#[fg=#15161e,bg=#7aa2f7,bold] #S "
      set -g status-right "#[fg=#7aa2f7,bg=#3b4261] #(echo '#{pane_current_path}' | sed 's#$HOME#~#; s#\\([^/]*/[^/]*/\\).*\\(/[^/]*/.*\\)$#\\1...\\2#; s#/#/#g') #[fg=#15161e,bg=#7aa2f7,bold] #(whoami)@#h "

      setw -g window-status-activity-style "underscore,fg=#a9b1d6,bg=#16161e"
      setw -g window-status-separator ""
      setw -g window-status-style "NONE,fg=#a9b1d6,bg=#16161e"
      setw -g window-status-format "#[fg=#16161e,bg=#16161e,nobold,nounderscore,noitalics]#[default] #I  #W #F "
      setw -g window-status-current-format "#[fg=#16161e,bg=#3b4261,nobold,nounderscore,noitalics]#[fg=#7aa2f7,bg=#3b4261,bold] #I  #W #F "
    '';
  };
}
