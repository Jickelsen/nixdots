{
  config,
  lib,
  pkgs,
  ...
}:

# From https://www.youtube.com/watch?v=GH3kpsbbERo
# converted using o1

let
  cfg = config.cliprograms.tmux;
  tmux-sessionx = pkgs.tmuxPlugins.mkTmuxPlugin {
    pluginName = "tmux-sessionx";
    version = "unstable-2024-12-28";
    src = pkgs.fetchFromGitHub {
      owner = "omerxx";
      repo = "tmux-sessionx";
      rev = "4f58ca79b1c6292c20182ab2fce2b1f2cb39fb9b";
      sha256 = "sha256-/fmcgFxu2ndJXYNJ3803arcecinYIajPI+1cTcuFVo0=";
    };
  };
in
{
  options.cliprograms.tmux.enable = lib.mkEnableOption "Custom Tmux config inspired by DevOps Toolbox";

  config = lib.mkIf cfg.enable {
    programs.tmux = {
      enable = true;

      prefix = "C-a";
      terminal = "screen-256color";
      baseIndex = 1;
      escapeTime = 0;
      historyLimit = 1000000;
      keyMode = "vi";

      plugins = with pkgs.tmuxPlugins; [
        sensible
        yank
        # resurrect
        # continuum
        tmux-thumbs
        tmux-fzf
        fzf-tmux-url
        catppuccin
        tmux-floax
        # tmux-sessionx
      ];

      extraConfig = ''
        ######################### ###############################################
        # TODO: Source an external reset file if you have one
        # source-file ~/.config/tmux/tmux.reset.conf

        ########################################################################
        # Install TPM and plugins
        # set -g @plugin 'tmux-plugins/tpm'
        # set -g @plugin 'tmux-plugins/tmux-sensible'
        # set -g @plugin 'tmux-plugins/tmux-yank'
        # set -g @plugin 'tmux-plugins/tmux-resurrect'
        # set -g @plugin 'tmux-plugins/tmux-continuum'
        # set -g @plugin 'fcsonline/tmux-thumbs'
        # set -g @plugin 'sainnhe/tmux-fzf'
        # set -g @plugin 'wfxr/tmux-fzf-url'
        # set -g @plugin 'catppuccin/tmux'
        # set -g @plugin 'omerxx/tmux-sessionx'
        # set -g @plugin 'omerxx/tmux-floax'

        ########################################################################
        # Use system clipboard
        set -g set-clipboard on

        ########################################################################
        # Don't exit from tmux when closing a session
        # set -g detach-on-destroy off

        #######################################################################
        # Renumber all windows when any window is closed
        set -g renumber-windows on

        #######################################################################
        # macOS / darwin style
        set -g status-position top

        ########################################################################
        # Terminal overrides
        set -g terminal-overrides ',xterm-256color:RGB'

        ########################################################################
        # Pane border styles
        set -g pane-active-border-style 'fg=magenta,bg=default'
        set -g pane-border-style 'fg=brightblack,bg=default'

        ########################################################################
        # FZF-URL plugin config
        set -g @fzf-url-fzf-options '-p 60%,30% --prompt="   " --border-label=" Open URL "'
        set -g @fzf-url-history-limit '2000'

        ########################################################################
        # floax / sessionx custom config
        set -g @floax-width '80%'
        set -g @floax-height '80%'
        set -g @floax-border-color 'magenta'
        set -g @floax-text-color 'blue'
        set -g @floax-bind 'p'
        set -g @floax-change-path 'true'

        # set -g @sessionx-bind-zo-new-window 'ctrl-y'
        # set -g @sessionx-auto-accept 'off'
        # set -g @sessionx-window-height '85%'
        # set -g @sessionx-window-width '75%'
        # set -g @sessionx-zoxide-mode 'on'
        # set -g @sessionx-custom-paths-subdirectories 'false'
        # set -g @sessionx-filter-current 'false'

        ########################################################################
        # continuum/resurrect
        # set -g @continuum-restore 'on'
        # set -g @resurrect-strategy-nvim 'session'

        ########################################################################
        # catppuccin theme
        # set -g @catppuccin_window_left_separator ""
        # set -g @catppuccin_window_right_separator " "
        # set -g @catppuccin_window_middle_separator " █"
        # set -g @catppuccin_window_number_position "left"

        set -g @catppuccin_window_status_style "slanted"

        set -g @catppuccin_window_default_fill "number"
        set -g @catppuccin_window_default_text "#W"
        set -g @catppuccin_window_current_fill "number"
        set -g @catppuccin_window_current_text "#W#{?window_zoomed_flag,(),}"
        set -g @catppuccin_status_modules_right "directory date_time"
        set -g @catppuccin_status_modules_left "session"
        set -g @catppuccin_status_left_separator  " "
        set -g @catppuccin_status_right_separator " "
        set -g @catppuccin_status_right_separator_inverse "no"
        set -g @catppuccin_status_fill "icon"
        set -g @catppuccin_status_connect_separator "no"
        set -g @catppuccin_directory_text "#{b:pane_current_path}"
        set -g @catppuccin_date_time_text "%H:%M"

      '';
    };
  };
}
