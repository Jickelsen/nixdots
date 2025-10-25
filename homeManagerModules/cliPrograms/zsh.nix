{
  lib,
  pkgs,
  inputs,
  config,
  ...
}:

let
  cfg = config.cliprograms.zsh;
in
{
  options.cliprograms.zsh.enable = lib.mkEnableOption "Zsh setup";

  config = lib.mkIf cfg.enable {
    # Default shell setup
    # Home Manager is pretty good at managing dotfiles. The primary way to manage
    # plain files is through 'home.file'.
    home.file = {
      ".config/starship/starship.toml".source = ../dotfiles/starship/starship.toml;
    };
    programs.zsh = {
      enable = true;
      initContent = ''
        # Heavily inspired by https://github.com/omerxx/dotfiles/blob/a2bbe85838bfa265f8624cb3f6d5977ee2cecbf1/nix-darwin/home.nix

        eval "$(starship init zsh)"
        export STARSHIP_CONFIG=~/.config/starship/starship.toml

        eval "$(zellij setup --generate-auto-start zsh)"

        # auto start tmux
        # if [ "$TMUX" = "" ]; then
        #   # check for old session
        #   if [ "$(tmux ls | grep -v attached | wc -l)" -gt "0" ]; then
        #   # attach to old sessio#n
        #   tmux a -t "$(tmux ls | grep -v attached | cut -d ":" -f1 | head -n 1)"
        #   else
        #   # start new session - dont use exec so it's possible to run without tmux
        #   tmux
        #   fi
        # fi

        export HELLO_TEST=$(cat ${config.sops.secrets.hello.path})

        # You may need to manually set your language environment
        # export LANG=en_US.UTF-8

        # export EDITOR=/opt/homebrew/bin/nvim

        alias la=tree
        #alias cat=bat
        alias switch=/home/jickel/.config/nix/rebuild.sh

        # Nix
        if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
            . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
        fi
        # End Nix

        # Nmap
        alias nm="nmap -sC -sV -oN nmap"

        alias cl='clear'

        # HTTP requests with xh!
        #alias http="xh"

        # VI Mode!!!
        # bindkey jj vi-cmd-mode

        # Eza
        alias l="eza -l --icons --git -a"
        alias lt="eza --tree --level=2 --long --icons --git"
        alias ltree="eza --tree --level=2  --icons --git"


        ### FZF ###
        # Set up fzf key bindings and fuzzy completion
        source <(fzf --zsh)

        # Nix!
        #export NIX_CONF_DIR=$HOME/.config/nix

        function ranger {
          local IFS=$'\t\n'
          local tempfile="$(mktemp -t tmp.XXXXXX)"
          local ranger_cmd=(
            command
            ranger
            --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
          )

          command rm -f -- "$tempfile" 2>/dev/null
        }
        alias rr='ranger'

        # navigation
        cx() { cd "$@" && l; }
        fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
        f() { echo "$(find . -type f -not -path '*/.*' | fzf)" | pbcopy }
        fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }

        #eval "$(zoxide init zsh)"
        #eval "$(atuin init zsh)"
      '';
    };
  };
}
