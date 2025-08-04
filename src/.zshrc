#
# zsh Environment
#

#

source ~/.config/zsh/functions/common.zsh

export FUNCNEST=10000 # Increase function nesting limit

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


# ---

# XDG - conventional locations for app data
# See https://specifications.freedesktop.org/basedir-spec/latest/
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Make programs respect XDG
export LESSHISTFILE="$XDG_CACHE_HOME/lesshst"




#
# Locations
#

export BREW_ROOT="/opt/homebrew"
export BREW_BIN="$BREW_ROOT/bin"
export DOTFILES="$HOME/Code/dotfiles"
export CONFIG="$DOTFILES/.config/"
export BUN_INSTALL="$HOME/.bun"



path=(
    "$HOME/Code/dotfiles/bin"
    "$BREW_ROOT/bin"
    "$BREW_ROOT/sbin"
    # PHP: Global tools installed with `composer global require`
    "$HOME/.config/composer/vendor/bin"
    # MySQL: installed with `brew`
    "/opt/homebrew/opt/mysql-client/bin"
    # VSCode: devcontainer cli
    "$HOME/Library/Application Support/Code/User/globalStorage/ms-vscode-remote.remote-containers/cli-bin"
    # dotnet
    "/usr/local/share/dotnet"
    "$HOME/.dotnet/tools"
    # bun 
    "$BUN_INSTALL/bin"
    # Standard locations 
    "/usr/local/bin"
    "/usr/local/sbin"
    "/usr/bin"
    "/usr/sbin"
    "/bin"
    "/sbin"
)

fpath=(
    "$HOME/.docker/completions"
    "/opt/homebrew/share/zsh/site-functions"
    # "$HOME/.config/zsh/functions" 
    $fpath
)


#
# Modern Shell
#

# ls => lsd
export LC_COLLATE="C"  # Sort dotfiles first in `ls -la` output

if installed lsd; then 
    alias ll='lsd -lA --group-dirs=first --date=+%Y-%m-%d'
    alias tree='lsd --tree'
else 
    alias ll='ls -lAFGh'
fi

alias l='ls -1A'

# cat => bat
if installed bat; then 
    export BAT_THEME="Monokai Extended"
    alias cat='bat'
fi

# du => dust
if installed dust; then 
    alias du='dust'
fi

# ps => procs
if installed procs; then
    alias ps='procs'
fi

# df => duf
if installed duf; then
    alias df='duf'
fi

# Fuzzy Finder `fzf`
if installed fzf; then
    export FZF_DEFAULT_COMMAND="fd --type file --color=always"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_OPTS="--preview 'lsd --tree --color=always {} | head -200'"
    export FZF_DEFAULT_OPTS="--ansi"
    source <(fzf --zsh) # keybindings and completions
    source $XDG_CONFIG_HOME/fzf-git.sh
fi



#
# Editing
#

# Edit the current command line with ctrl-x ctrl-e
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line


function edit
{
    $EDITOR $*
}

alias e='edit'

if installed subl; then
    export VISUAL="subl"
fi

if installed code; then
    export VISUAL="code"
else
    export VISUAL="$EDITOR"
fi

if installed vim; then
    export EDITOR="vim"
    alias vi="vim"
fi

if installed nvim; then
    export EDITOR="nvim"
    alias vim="nvim"
    alias vi="nvim"
fi





# Shortcuts for editing configuration files
alias gitconfig="edit ${DOTFILES}/src/.gitconfig"
alias hosts="sudo ${EDITOR} /etc/hosts"
alias zshrc="edit ~/.zshrc; source ~/.zshrc"
alias sshconfig="edit ~/.ssh/config"
alias tmuxconfig="edit ${CONFIG}/tmux/tmux.conf; tmux source-file ${CONFIG}/tmux/tmux.conf"
alias dotfiles="cd $DOTFILES && edit $DOTFILES"
alias secrets="edit ${XDG_CONFIG_HOME}/secrets.env; source ${XDG_CONFIG_HOME}/secrets.env"
alias vimrc="cd $DOTFILES && edit src/.config/nvim/lua/plugins/user.lua"
alias resh="exec $SHELL"

# Copy + print SSH public key
alias pubkey="cat ~/.ssh/id_rsa.pub | tee >(pbcopy)"



#
# Development
#

# Github
export GITHUB_USER='jrdmcgr'


# Python
export PYTHONDONTWRITEBYTECODE=1  # Python won't write .pyc files
export PYTHON_BIN="/Library/Frameworks/Python.framework/Versions/3.11/bin"

## Root Python - only used to create virtual environments
alias python="$PYTHON_BIN/python3.11"

# Source a python virtual environment,
#   creating one if it doesn't exist.
function venv
{
    if [ -d ".venv" ]
    then python -m venv .venv
    fi

    source .venv/bin/activate
}


# Javascript

## bun
include "$HOME/.bun/_bun"


# Rust
if [ -f $HOME/.cargo/env ]; then
    source "$HOME/.cargo/env"
fi

# PHP
alias serve.php='php -S 0:9000'
alias art='php artisan'

if installed psysh; then
	function php
	{
		if [ $# -eq 0 ]
		then psysh
		else php $*
		fi
	}
fi



#
# General Computing 
#

# mkdir - create intermediate directories
alias mkdir='mkdir -p'


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

# Make file executable and execute it.
function execute {
    if [ ! -x "$1" ]; then
        chmod +x "$1"
    fi

    if [[ "$1" =~ / ]]; then
        "$1"
    else
        ./"$1"
    fi
}

alias x='execute'

function cut-on-tabs
{
    cut -f ${1:-1}
}

alias ct=cut-on-tabs

function cut-on-spaces
{
    cut -d' ' -f ${1:-1}
}

alias cs='cut-on-spaces'


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

# Homebrew
export HOMEBREW_INSTALL_FROM_API=1
export HOMEBREW_NO_AUTO_UPDATE=1
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_NO_ENV_HINTS=1

# Describe all programs installed by brew (excluding dependencies)
function brewed
{
    brew leaves | xargs brew desc 2>/dev/null
}

function casks
{
    brew list --cask | xargs brew desc --cask
}



#
# Prompt
#
if installed starship; then
    eval "$(starship init zsh)"
else
    # Fallback to default prompt if starship is not installed
    PROMPT='> '
fi



#
# Sources
#

include "$HOME/.config/secrets.env"


#
# Setup
#

# fpath + completions
autoload -Uz compinit
compinit


if installed zoxide; then
    eval "$(zoxide init zsh --cmd cd)"
fi

bindkey -e # Use emacs keybindings in the command line

eval "$(rbenv init - --no-rehash zsh)"

