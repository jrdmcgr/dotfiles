#!/bin/bash
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now!
	return
fi

# Install: Symlink all dotfiles to $HOME.
function install {
	# Generate the ignore regex from lines in the ignore file.
	set ignore = '' 
	for line in `cat ~/dotfiles/ignore`; do
		set ignore = $ignore$(echo \\$line\| | tr -d "\n") 
	done
	# This removes the last pipe char. 
	set ignore = $(echo "${ignore%?}")

	for file in `ls -a ~/dotfiles |
			  # List all files that begin with a dot.
			  egrep '^\..*' | 
			  # Filter out files listed in the ignore file.
			  egrep -v "$ignore" |
			  # filter out dot and dotdot.
			  egrep -v '^\.$|^\.\.$'`; do 
		ln -s ~/dotfiles/$file ~/
	done
}

# If a given directory exists, source all files in it.
function sourcedir {
	if [ -d $1 ]; then 
		for i in `ls $1`; do 
			source $1/$i
		done
	fi
}

# Source global files.
sourcedir ~/dotfiles/Global

# Source OS specific files.
sourcedir ~/dotfiles/$(uname)

# Source host specific files.
sourcedir ~/dotfiles/$(hostname)
