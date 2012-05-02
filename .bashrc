#!/bin/bash
if [[ $- != *i* ]]; then
	# Shell is non-interactive.  Be done now!
	return
fi

function escape_regex { 
	local buffer="";
	buffer=${1//\\/\\\\}; # replace backslash
	buffer=${buffer//\./\\\.}; # replace any .
	buffer=${buffer//\*/\\\*}; # replace quantifier *
	buffer=${buffer//\+/\\\+}; # replace quantifier +
	buffer=${buffer//\?/\\\?}; # replace query
	buffer=${buffer//\^/\\\^}; # replace sol
	buffer=${buffer//'$'/'\$'}; # replace eol
	buffer=${buffer//'|'/'\|'}; # replace or
	buffer=${buffer//'['/'\['}; # replace class open
	buffer=${buffer//']'/'\]'}; # replace class close    
	buffer=${buffer//'{'/'\{'}; # replace bound open
	buffer=${buffer//'}'/'\}'}; # replace bound close
	buffer=${buffer//'('/'\('}; # replace group open
	buffer=${buffer//')'/'\)'}; # replace group close
	buffer=${buffer//\"/\\\"}; # replace double quote
	buffer=${buffer//\'/\\\'}; # replace single quote
	echo -n "$buffer";
}


# Install: Symlink all dotfiles to $HOME.
function install {
	# Generate the ignore regex from lines in the ignore file.
	for line in `cat ~/dotfiles/ignore`; do 
		local ignore="$ignore""^"$( escape_regex $line | tr -d "\n"; )"$|"
	done;
	# This removes the last pipe char. 
	local ignore=$(echo "${ignore%?}")
	echo $ignore
	for file in `ls -a ~/dotfiles |
			  # List all files that begin with a dot.
			  egrep '^\..*' | 
			  # Filter out files listed in the ignore file.
			  egrep -v "$ignore" |
			  # filter out dot and dotdot.
			  egrep -v '^\.$|^\.\.$'`; do
		echo "Linking $file"
		ln -Fs ~/dotfiles/$file ~/
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
sourcedir dotfiles/Global

# Source OS specific files.
sourcedir dotfiles/$(uname)

# Source host specific files.
sourcedir dotfiles/$(hostname)