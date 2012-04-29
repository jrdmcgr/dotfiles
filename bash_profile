#!/bin/bash

# If a given directory exists, source all files in it.
function sourcedir {
	if [ -d $1 ]
		then for i in `ls $1` 
			do source $1/$i
		done
	fi
}

# Source global files.
sourcedir Dotfiles/Global

# Source OS specific files.
sourcedir Dotfiles/$(uname)

# Source host specific files.
sourcedir Dotfiles/$(hostname)