# Heavily inspired by https://github.com/omerxx/dotfiles/blob/a2bbe85838bfa265f8624cb3f6d5977ee2cecbf1/nix-darwin/home.nix

eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# export EDITOR=/opt/homebrew/bin/nvim

alias la=tree
alias cat=bat

 # Nix
 if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
    . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
 fi
 # End Nix

# Git
# alias gc="git commit -m"
# alias gca="git commit -a -m"
# alias gp="git push origin HEAD"
# alias gpu="git pull origin"
# alias gst="git status"
# alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
# alias gdiff="git diff"
# alias gco="git checkout"
# alias gb='git branch'
# alias gba='git branch -a'
# alias gadd='git add'
# alias ga='git add -p'
# alias gcoall='git checkout -- .'
# alias gr='git remote'
# alias gre='git reset'

# Docker
# alias dco="docker compose"
# alias dps="docker ps"
# alias dpa="docker ps -a"
# alias dl="docker ps -l -q"
# alias dx="docker exec -it"

# Dirs
# alias ..="cd .."
# alias ...="cd ../.."
# alias ....="cd ../../.."
# alias .....="cd ../../../.."
# alias ......="cd ../../../../.."


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

	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
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