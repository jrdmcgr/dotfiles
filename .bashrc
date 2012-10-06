#!/bin/bash

# FIX: When linking directories a symlink is also created in the directory 
#   being linked.
#
# TODO: Write a function to clean up old dotfile links and remove all links.
# TODO: Write a main function that installs and cleans everything.
# TODO: Write a function that reports the status of the dotfiles:
#   What needs to be linked and cleaned.

#== Configuration ==#

# Set the default dotfile directory.
dotfile_directory=$HOME/dotfiles
# Ignore these files when linking.
ignore=( .git .gitignore .DS_Store )
# Include these files when linking.
include=( bin )


# link_dotfiles:
#   Symlink all in $source_directory that begin with a dot unless they are included
#   in the ignore array. Use the include array to link files that don't begin 
#   with a dot.
# Arguments:
#   1 $source_directory - the directory containing the files to be linked. Defaults
#       to the $dotfile_directory.
#   2 $destination - the directory in which to make the links. Defaults to $HOME.
link_dotfiles() {
    source_directory=${1-$dotfile_directory}
    destination=${2-$HOME}
	for i in `ls -a $source_directory`; do
		# if the file is in the include array or it begins with a dot
        if ! (echo ${include[*]} | grep -q $i) && ! [[ $i == .* ]]
            then continue
        fi

        # and it's not in the ignore array
		if (echo ${ignore[*]} | grep -q $i)
            then continue
        fi
		
		# then link the file, but don't overwrite regular files.
		if [ -f $destination/$i ] && ! [ -L $destination/$i ]; then
			echo "$i could not be linked; a regular file exists at $destination/$i"
		else
			echo "Linking $i"
			ln -fs $source_directory/$i $destination/$(basename $i)
		fi
	done
}


# sourcedir:
#   Source all .sh files in the given directory.
sourcedir() {
	if [ -d $1 ]; then 
		for i in `ls $1/*.sh`; do 
			source $i
		done
	fi
}

# install_vim_bundles:
#   Bootstrap vim bundles: Install vundle and then run BundleInstall.
#   This makes sure that all bundles are installed, so that we don't have to 
#   keep them in the repo, since vundle keeps it's own repos for vim bundles.
install_vim_bundles() {
    if [ ! -d ~/.vim/bundle/vundle ]; then
        mkdir -p ~/.vim/bundle/vundle
        git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
    fi

    vim +BundleInstall +qall &

    exit 0
}

# Source global files.
sourcedir $dotfile_directory

# Source OS specific files.
sourcedir $dotfile_directory/$(uname)

# Source host specific files.
sourcedir $dotfile_directory/$(hostname)
