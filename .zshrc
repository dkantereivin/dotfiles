# Reference: https://github.com/ohmyzsh/ohmyzsh/wiki/Settings


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Updates
zstyle ':omz:update' frequency 30
zstyle ':omz:update' mode auto      # update automatically without asking

# Display red waiting dots.
COMPLETION_WAITING_DOTS="true"

# Completions
HYPHEN_INSENSITIVE="true"

# History
HIST_STAMPS="dd.mm.yyyy"
HISTSIZE=5000
SAVEHIST=10000


# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting)
setopt autocd extendedglob
source $ZSH/oh-my-zsh.sh

### User configuration ###
export EDITOR="nvim"
export SHELL="zsh"


# Aliases
alias vim="$EDITOR"

# Modify Config
alias mod-awesome="nvim ~/.config/awesome/rc.lua"

# shell
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"
alias rimraf="rm -rf"

# kitty/kittens
alias ssh="kitty +kitten ssh"

# git
if [ ! -z $(command -v git) ]; then
    alias dotfiles="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"
    alias gcl="git clone"
	alias gres="git reset --hard"
	alias gff="gres && git pull"
    alias glogs="git log --graph --abbrev-commit -n 25 --pretty='%Cred%h%Creset - %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
    # todo: glogl
	alias glogd="glogs -p"
	alias yolo='git commit -am "[generated] $(curl -s http://whatthecommit.com/index.txt)"'
fi


# exa - a modern replacement for ls.
if [ ! -z $(command -v exa) ]; then
	# todo
fi

# convenience
alias mktmp="cd $(mktemp -d)"
alias physug="kitty +kitten ssh -Y kantered@phys-ugrad"
alias ss="flameshot gui"
# awesome
alias aww="Xephyr :5 & sleep 1 ; DISPLAY=:5 awesome"

# Compilation flags
export ARCHFLAGS="-arch x86_64"

# Startup

# pfetch
export PF_INFO="ascii title os host kernel uptime pkgs memory palette"
pfetch
source /usr/share/nvm/init-nvm.sh

# pnpm
export PNPM_HOME="/home/david/.local/share/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end