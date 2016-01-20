#!/bin/bash



#
# Environment
#

# PATHs
PATH=$HOME/bin
PATH=$PATH:/usr/local/bin:/usr/local/sbin
PATH=$PATH:/usr/bin:/usr/sbin:/bin:/sbin
PATH=$PATH:/usr/local/opt/ruby/bin  # Ruby
PATH=$PATH:/usr/local/share/npm/bin  # Node
PATH=$PATH:~/.cabal/bin  # Haskell
PATH=$PATH:~/.composer/vendor/bin  # PHP
export PATH

export LC_COLLATE="C"  # Sort dotfiles first in `ls -la` output
export PYTHONDONTWRITEBYTECODE=1  # Python won't write .pyc files
# EDITOR is Sublime on Mac, vim on Linux
if [ $(uname) = "Darwin" ]; then
    export EDITOR='subl -w'
else
    export EDITOR='vim'
fi
export GITHUB_USER='jrdmcgr'
export PYTHONPATH='/usr/local/lib/python2.7/site-packages'
export NODE_PATH='/usr/local/share/npm/lib/node_modules'
export HOMEBREW_GITHUB_API_TOKEN="c769af48ce7464baf787e1a74fa6c222223d2643"
source `brew --prefix`/Library/Contributions/brew_bash_completion.sh



#
# Prompt
#

my_prompt() {
    # If we're home then use a simple prompt.
    if [ "$(pwd)" == $HOME ]; then
        PS1=' \[\e[0;32m\]⚡\[\e[0m\] '

    # Check for git bash completion on Mac.
    elif [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
        source /usr/local/etc/bash_completion.d/git-completion.bash;
        if [ -f /usr/local/etc/bash_completion.d/git-prompt.sh ]; then
            source /usr/local/etc/bash_completion.d/git-prompt.sh
        fi
        PS1='〈 \w$(__git_ps1 " ± %s") 〉\[\e[0;32m\]⚡\[\e[0m\]  '

    # Check for git bash completion on Linux.
    elif [ -f /etc/bash_completion.d/git ]; then
        source /etc/bash_completion.d/git;
        PS1='〈 \w$(__git_ps1 " ± %s") 〉\[\e[0;32m\]⚡\[\e[0m\]  '

    # Display the standard prompt.
    else
        PS1='〈 \w 〉\[\e[0;32m\]⚡\[\e[0m\]  '
    fi
}

export PROMPT_COMMAND=my_prompt



#
# Functions / Aliases
#

# Reload .bashrc
alias rebash='source ~/.bashrc'
alias ll='ls -lAFGh'
alias +x="chmod +x"
alias tf="tail -f"
alias fn="find . -iname"
alias pse="ps -eo pid,user,command"
alias sqlite="sqlite3"
alias ccat="pygmentize"
alias serve="python -m SimpleHTTPServer"
alias isodate="date -u +%FT%TZ"

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

# Mac Specific Aliases
alias ip="ipconfig getifaddr en0"
# Forward port 8080 to 80
alias vbox='VBoxManage'
alias cask="brew cask"


# Source all .sh files in the given directory.
sourcedir() {
	if [ -d $1 ]; then
		for file in ${1}/*.sh; do
			source $file
		done
	fi
}

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

# How much memory is Chrome using?
chromemem() {
    ps -eo pmem,comm | grep 'Google Chrome' | cut -d ' ' -f 2 | sum
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
    sudo find / -iname '*$1*'
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



#
# Setup
#

setup_z_completions
