#
# zsh Environment
#

setopt AUTO_CD

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" 


# Shell History
# See https://zsh.sourceforge.io/Doc/Release/Options.html#History
export HISTFILE="$HOME/.zsh_history"
export HISTFILESIZE=7000000
export HISTSIZE=7000
export HISTTIMEFORMAT="%F %T "
export SAVEHIST=70000000

setopt append_history
setopt extended_history
setopt hist_find_no_dups
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_verify
setopt inc_append_history
setopt share_history

# XDG - conventional locations for app data
# See https://specifications.freedesktop.org/basedir-spec/latest/
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export LESSHISTFILE="$XDG_CACHE_HOME/lesshst"



#
# Homebrew
#
export BREW_ROOT="/opt/homebrew"
export BREW_BIN="$BREW_ROOT/bin"
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1

# Describe all programs installed by brew (excluding dependencies)
function brewed
{
    brew leaves | xargs brew desc 2>/dev/null
}

function casks
{
    brew list --cask | xargs brew desc --cask
}

function brew-completions
{
    if type brew &>/dev/null
    then
        FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
        autoload -Uz compinit
        compinit
    fi
}




#
# PATH
#

PATH="$HOME/bin"
PATH="$PATH:$BREW_ROOT/bin"
PATH="$PATH:$BREW_ROOT/sbin"
PATH="$PATH:/usr/local/bin:/usr/local/sbin"
PATH="$PATH:/usr/bin:/usr/sbin:/bin:/sbin"
PATH="$PATH:/opt/homebrew/opt/mysql-client/bin"
export PATH



#
# Modern Shell
#

# Edit the current command line with ctrl-x ctrl-e
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

function exists
{
    which $1 >/dev/null
}

# ls => lsd
export LC_COLLATE="C"  # Sort dotfiles first in `ls -la` output

if exists lsd; then 
    alias ll='lsd -lA --group-dirs=first --date=+%m-%d-%Y'
    alias tree='lsd --tree'
else 
    alias ll='ls -lAFGh'
fi

# cat => bat
if exists bat; then 
    alias cat='bat'
fi

export BAT_THEME="Monokai Extended"

# du => dust
if exists dust; then 
    alias du='dust'
fi

# ps => procs
if exists procs; then
    alias ps='procs'
fi

# df => duf
if exists duf; then
    alias df='duf'
fi

# Fuzzy Finder `fzf`
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_OPTS="--preview 'lsd --tree --color=always {} | head -200'"
export FZF_DEFAULT_OPTS="--ansi"
source <(fzf --zsh) # keybindings and completions
source $XDG_CONFIG_HOME/fzf-git.sh

# 
# Configuration
#

if exists nvim; then
    export EDITOR="nvim"
    export VISUAL="nvim"
    alias vim='nvim'
    alias vi='nvim'
fi

function edit
{
    $EDITOR $*
}

# Shortcuts for config edits
alias gitconfig="edit ~/.gitconfig"
alias hosts="sudo $EDITOR /etc/hosts"
alias zshrc="edit ~/.zshrc; source ~/.zshrc"
alias sshconfig="edit ~/.ssh/config"

# Copy + print SSH public key
alias pubkey="cat ~/.ssh/id_rsa.pub | tee >(pbcopy)"



#
# Development
#

# Github
export GITHUB_USER='jrdmcgr'
#NOTE: Github key is in private.sh


# Python
export PYTHONDONTWRITEBYTECODE=1  # Python won't write .pyc files
export PYTHON_BIN="/Library/Frameworks/Python.framework/Versions/3.11/bin"

# Root Python - only used to create virtual environments
alias py="$PYTHON_BIN/python3.11"

# Source a python virtual environment,
#   creating one if it doesn't exist.
function venv
{
    if [ -d ".venv" ]
    then py -m venv .venv
    fi

    source .venv/bin/activate
}


# Javascript

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

function bun-completions
{
    [ -s "/Users/jrdmcgr/.bun/_bun" ] && source "/Users/jrdmcgr/.bun/_bun"
}

# npm
alias ni='npm install'
alias nid='npm install --save-dev'
alias nis='npm install --save'


# Rust
if [ -f $HOME/.cargo/env ]; then
    source "$HOME/.cargo/env"
fi


# PHP
alias serve.php='php -S 0:9000'
alias art='php artisan'

if exists psysh; then
	function php
	{
		if [ $# -eq 0 ]
		then $BREW_BIN/psysh
		else $BREW_BIN/php $*
		fi
	}
fi



#
# General Computing 
#


# Make a directory and cd into it.
function mcd
{
  mkdir -p "$1" && cd "$1";
}

# Scope out the contents of a file.
function inspect
{
    (head -5; tail -5) < $1
}


function execute {
    local file="$1"
    if [ ! -x $file ]; then
        chmod +x $file
    fi
    if [[ $1 =~ / ]]; then
        $1
    else
        ./$1
    fi
}
alias x='execute'

alias isodate="date +%F"
alias isotime="date +%FT%TZ"
alias sqlite="sqlite3"

# Networking
alias wanip='curl ifconfig.me'
alias lanip="ipconfig getifaddr en0"
alias myip="lanip;wanip"
alias p3='ping -c3'
alias diga='dig +noall +answer'
alias ifactive="ifconfig | rg --multiline -o '^[^\t:]+:([^\n]|\n\t)*status: active'"
alias http-headers="curl -LsSD - -o /dev/null"

alias weather='curl http://wttr.in/lakeland,fl'



#
# macOS Computing
#

# Show/hide hidden files in Finder
alias showfile="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefile="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesk="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesk="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"


function trash 
{
    mv "$1" ~/.Trash
}

function flushdns
{
    sudo dscacheutil -flushcache;
    sudo killall -HUP mDNSResponder
}

# Mac: quicklook a file
function quicklook 
{
	qlmanage -p "$@" >& /dev/null &
}

alias ql="quicklook"

# Set the tab title in iTerm 2
function tab-title
{
  echo -ne "\033];${1}\007";
}

alias tt="tab-title"



#
# Prompt
#

eval "$(starship init zsh)"



#
# Setup
#

brew-completions
bun-completions
eval "$(zoxide init zsh --cmd cd)"

# Login Data
# archey -o
