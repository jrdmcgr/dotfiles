#!/bin/bash

## Configuration ##
# Set the default dotfile directory.
dotfile_directory=$HOME/dotfiles
# Ignore these files when linking.
ignore=( .git .gitignore .DS_Store )


# link_dotfiles: Symlink all dotfiles to $HOME. 
# This only links files that begin with a dot.
# TODO: 
# TODO: This should accept a directory as the first arg which would default to
#   ~/dotfiles and a target directory as a second arg which defauls to $HOME.
#   This will allow host specific files to overwrite global ones.
link_dotfiles() {
	for i in `ls -a $dotfile_directory`; do
		# if the file begins with a dot
		! [[ $i == .* ]] && continue
		
		# and it's not in the ignore array
		(echo ${ignore[*]} | grep -q $i) && continue
		
		# then link the file, but don't overwrite regular files.
		if [ -f $HOME/$i ] && ! [ -L $HOME/$i ]; then
			echo "$i could not be linked; a regular file exists at $HOME/$i"
		else
			echo "Linking $i"
			ln -fs $dotfile_directory/$i $HOME/$(basename $i)
		fi
	done
}


# If a given directory exists, source all .sh files in it.
sourcedir() {
	if [ -d $1 ]; then 
		for i in `ls $1/*.sh`; do 
			source $i
		done
	fi
}


# Source global files.
sourcedir $dotfile_directory

# Source OS specific files.
sourcedir $dotfile_directory/$(uname)

# Source host specific files.
sourcedir $dotfile_directory/$(hostname)
