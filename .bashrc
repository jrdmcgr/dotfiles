#!/bin/bash
#
# Environment
#

# History
# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=10000
# shopt -s histappend # append, don't overwrite
# shopt -s autocd


# PATHs
MYPATH=$HOME/bin
MYPATH=$MYPATH:/usr/local/opt/ruby/bin  # Ruby
MYPATH=$MYPATH:/usr/local/share/npm/bin  # Node
MYPATH=$MYPATH:~/.cabal/bin  # Haskell
MYPATH=$MYPATH:~/.composer/vendor/bin  # PHP
MYPATH=$MYPATH:${GOPATH}/bin # Go
MYPATH=$MYPATH:$HOME/Library/Python/3.9/bin # Python
MYPATH=$MYPATH:/usr/local/opt/mysql-client/bin
MYPATH=$MYPATH:/Users/jared/Library/Android/sdk/platform-tools
MYPATH=$MYPATH:/Users/jared/Library/Android/sdk/cmdline-tools/latest/bin
MYPATH=$MYPATH:/Users/jared/Library/Android/sdk/tools/bin
MYPATH="$HOME/.jenv/bin:$MYPATH"
MYPATH=$MYPATH:/usr/local/bin:/usr/local/sbin
MYPATH=$MYPATH:/usr/bin:/usr/sbin:/bin:/sbin
PATH="$MYPATH:$PATH"
export PATH

export ANDROID_SDK_ROOT="/Users/jared/Library/Android/sdk"
export EDITOR="vim"
export LC_COLLATE="C"  # Sort dotfiles first in `ls -la` output
# export PYTHONDONTWRITEBYTECODE=1  # Python won't write .pyc files
# export PYTHONPATH='/usr/local/lib/python2.7/site-packages'
export NODE_PATH='/usr/local/share/npm/lib/node_modules'
export GITHUB_USER='jrdmcgr'
export GOPATH=$HOME/.go
export FZF_DEFAULT_COMMAND="fd --type file --color=always"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_DEFAULT_OPTS="--ansi"
export DOTFILE_PATH="$HOME/Dropbox/Projects/Jared McGuire/Code/dotfiles"

# Sources
source "$DOTFILE_PATH/private.sh"
# source /usr/local/opt/chruby/share/chruby/chruby.sh

#
# Prompt
#

#export PS1=' \[\e[0;32m\]⚡\[\e[0m\] '

# Colors
light_green="\[\e[1;32m\]"
light_red="\[\e[1;31m\]"
yellow="\[\e[0;33m\]"
gray="\[\e[0;37m\]"
reset="\[\e[m\]"

# Customize prompt
prompt_command() {
  local status="$?"
  local status_color=""
  if [ $status != 0 ]; then
    status_color=$light_red
  else
    status_color=$light_green
  fi
  export PS1="${status_color}⚡${reset} "
}
export GIT_PS1_SHOWDIRTYSTATE=1
export PROMPT_COMMAND=prompt_command


#
# Functions / Aliases
#

# Reload .bashrc
alias rebash='source ~/.bashrc'
if [ -f /usr/local/bin/lsd ]; then
    alias ll='lsd -lA --group-dirs=first --date=+%m-%d-%Y'
    alias tree='lsd --tree'
else
    alias ll='ls -lAFGh'
fi

# if [ -f $(which bat) ]; then
#    alias cat='bat'
# fi



# alias +x="chmod +x"
alias tlf="tail -f"
alias fn="find . -iname"
alias pse="ps -eo pid,user,command"
alias sqlite="sqlite3"
# alias ccat="pygmentize"
alias serve="python -m http.server"
alias d="date +%F"
alias isodate="date +%FT%TZ"
alias weather='curl http://wttr.in/lakeland,fl'
alias p3='ping -c3'
alias curlheaders="curl -LsSD - -o /dev/null"
alias d1='du -hd1 | gsort -h'
alias myip='dig +short myip.opendns.com @resolver1.opendns.com'
alias diga='dig +noall +answer'
alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# Python Aliases
#alias python='python3'
#alias pip='pip3'
alias i='ipython'
alias t='nosetests'
alias vv='virtualenv .venv'
alias vva='source .venv/bin/activate'
alias ppi='pip3 install -U'
alias ppu='pip3 uninstall'
alias ppf='pip3 freeze -l > requirements.txt'
alias ppr='pip3 install -r requirements.txt'

# PHP Aliases
alias phpsh='psysh'
alias phpserve='php -S 0:9000'
alias art='php artisan'
alias ci='composer install'
alias cu='composer update'
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

# Vagrant Aliases
alias v='vagrant'
alias vup='vagrant up'
alias vdn='vagrant halt'
alias vss='vagrant ssh'
alias vst='vagrant status'
alias vcf='vagrant ssh-config'
alias vdf='vagrant destroy -f'
alias vre='vagrant reload'
alias vpr='vagrant provision'

# Docker Aliases
alias calc=/usr/bin/dc  # rewrite this alias
alias dc='docker-compose'
alias dcdv='docker-compose -f docker-compose.yml -f docker-compose.db.yml up --detach --remove-orphans'
alias dcup='docker-compose up'
alias dcud='docker-compose up --detach'
alias dcub='docker-compose up --build --detach --remove-orphans'
alias dcex='docker-compose exec'
alias dcdn='docker-compose down'
alias dps="docker-pretty-ps"
alias dex='docker exec -it'

# Terraform aliases
alias tf='terraform'

# Node Aliases
alias ni='npm install'
alias nid='npm install --save-dev'
alias nis='npm install --save'


# Mac Specific Aliases
alias lan="ipconfig getifaddr en0"
alias wan="curl ip.me"
alias ip="lan;wan"
alias vbox='VBoxManage'
# Show/hide hidden files in Finder
alias showfile="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidefile="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
# Hide/show all desktop icons (useful when presenting)
alias hidedesk="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesk="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Config file shortcuts
alias gitconfig='vim ~/.gitconfig'
alias hosts='sudo vim /etc/hosts'
alias bashrc='vim ~/.bashrc; source ~/.bashrc'
alias private="vim $(echo $DOTFILE_PATH | sed -E 's/ /\\ /g')/private.sh"
alias sshconfig='vim ~/.ssh/config'
alias vimrc='vim ~/.vimrc'
alias pubkey='cat ~/.ssh/id_rsa.pub | tee >(pbcopy)'

# Ansible shortcuts
function ansible-provision {
    local env="$1"
    shift
    local args="$@"
    # TODO: if tags, then apply tags
    ansible-playbook -i "$env" main.yml $args
}
alias apr="ansible-provision"
alias ap="ansible-playbook"


# Misc functions
function _note {
    local domain="$1"
    local name="$2"
    cd "$HOME/Dropbox/Notes/${domain}/Drafts"
    if [ -z $name ]; then
        subl "$(d).md"
    else
        subl "$(d) ${name}.md"
    fi
}
alias note="_note Home"
alias worknote="_note Informulate"

function blog {
    local title="${1:-Untitled}"
    local meta="---
Title: $title
Author: Jared McGuire
Date: $(d)
Template: single
---";
    local file="$HOME/Dropbox/Notes/Home/Published/articles/$(d) $title.md"
    echo "$meta" > "$file"
    subl "$file"
}


trash() {
    mv "$1" ~/.Trash
}

flushdns() {
    sudo dscacheutil -flushcache;
    sudo killall -HUP mDNSResponder
}


# Python calculator
py() {
    python3 -c "from math import *; print($*)"
}


# Source all .sh files in the given directory.
sourcedir() {
	if [ -d $1 ]; then
		for file in ${1}/*.sh; do
			source $file
		done
	fi
}

# Mac: quicklook a file
ql() {
	qlmanage -p "$@" >& /dev/null &
}

# Sum a list of numbers from stdin
sum() {
	local total=0
	while read value; do
		total=$(($total + $value))
	done
}

# Set the tab title in iTerm 2
tt() {
  echo -ne "\033];${1}\007";
}

# Make a directory and cd into it.
mcd() {
  mkdir -p "$1" && cd "$1";
}

# Scope out the contents of a file.
inspect() {
    (head -5; tail -5) < $1
}

findall() {
    sudo find / -iname "\*$1\*"
}

findlike() {
    find . -iname "\*$1\*"
}

# Edit a remote file with Sublime Text.
sublr() {
	local filename="$1"
	scp $1 ./ &&
	subl -w ./$filename &&
	scp ./$filename $1
}

hr() {
    local column_count=$(tput cols)
    for _ in $(seq $column_count); do
        echo -n "-"
    done
}

forward_port() {
    local from_port="$1"
    local to_port="$2"
    echo "rdr pass inet proto tcp from any to any port ${to_port} -> 127.0.0.1 port ${from_port}" | sudo pfctl -ef -
}

reset_port_forwarding() {
    sudo pfctl -f /etc/pf.conf
}

lookup-host() {
    grep -E "\b$1\b" /etc/hosts | cut -d ' ' -f 1
}

# Move a file with a substitution regex.
smv() {
    local src="$1"
    local dest="$2"
    local new=$(echo $src | sed -E "$dest")
    mv "$src" "$new"
}

# Sorted Disk Usage
sdu() {
    du -hd1 "$1" | sort -h
}

# link_dotfiles:
#   Symlink all in $source_directory that begin with a dot unless they are included
#   in the ignore array. Use the include array to link files that don't begin
#   with a dot.
# Arguments:
#   1 $source_directory - the directory containing the files to be linked. Defaults
#       to the $HOME/dotfiles.
#   2 $destination - the directory in which to make the links. Defaults to $HOME.
link_dotfiles() {
    local source_directory="${1-$HOME/dotfiles}"
    local destination="${2-$HOME}"
    local ignore_files=(.git .gitignore .DS_Store )
    for file in $source_directory/.*; do
        # skip if the file is in the ignore array
        if (echo ${ignore_files[*]} | grep -q $file); then
            continue
        fi

        # then link the file, but don't overwrite regular files.
        if [ -f $destination/$file ] && ! [ -L $destination/$file ]; then
            echo "$file could not be linked; a regular file exists at $destination/$file"
        else
            echo "Linking $file"
            ln -fs "$file" "$destination"
        fi
    done
}

# list_dotfile_links:
#   List all dotfiles that are links in a directory
list_dotfile_links() {
    local directory="$1"
    for file in $directory/.*; do
        if [ -L "$file" ]; then
            local link=$(readlink $file)
            if [[ $link == $dotfile_directory* ]]; then
                echo "$file"
            fi
        fi
    done
}

# clean_dotfiles:
#   Remove all linked dotfiles
clean_dotfiles() {
    local links="$(list_dotfile_links $HOME)"
    echo "Removing files: "
    echo "$links"
    rm $links
}

# Setup completions for z
setup_z_completions() {
    local zpath="$(brew --prefix)/etc/profile.d/z.sh"
    if [ -f $zpath ]; then
        source `brew --prefix`/etc/profile.d/z.sh
    fi
}

setup_brew_completions() {
  if type brew &>/dev/null; then
    HOMEBREW_PREFIX="$(brew --prefix)"
    if [[ -r "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh" ]]; then
      source "${HOMEBREW_PREFIX}/etc/profile.d/bash_completion.sh"
    else
      for COMPLETION in "${HOMEBREW_PREFIX}/etc/bash_completion.d/"*; do
        [[ -r "$COMPLETION" ]] && source "$COMPLETION"
      done
    fi
  fi
}

# http://thirtysixthspan.com/posts/grep-history-for
# ghf - [G]rep [H]istory [F]or top ten commands and execute one
# usage:
#  Most frequent command in recent history
#   ghf
#  Most frequent instances of {command} in all history
#   ghf {command}
#  Execute {command-number} after a call to ghf
#   !! {command-number}
function latest-history { history | tail -n 50 ; }
function grepped-history { history | grep "$1" ; }
function chop-first-column { awk '{for (i=2; i<NF; i++) printf $i " "; print $NF}' ; }
function add-line-numbers { awk '{print NR " " $0}' ; }
function top-ten { sort | uniq -c | sort -r | head -n 10 ; }
function unique-history { chop-first-column | top-ten | chop-first-column | add-line-numbers ; }
function ghf {
  if [ $# -eq 0 ]; then latest-history | unique-history; fi
  if [ $# -eq 1 ]; then grepped-history "$1" | unique-history; fi
  if [ $# -eq 2 ]; then
    `grepped-history "$1" | unique-history | grep ^$2 | chop-first-column`;
  fi
}

#
# Setup
#

if [ -d ~/.bash_completion.d ]; then
  for file in ~/.bash_completion.d/*; do
    source $file
  done
fi

# eval "$(jenv init -)"

#setup_z_completions
# archey -o

. "$HOME/.cargo/env"
