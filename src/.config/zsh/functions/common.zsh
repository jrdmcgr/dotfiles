# Common functions for zsh scripts

function installed
{
    which "$1" > /dev/null
}


function include
{
    if [ -e "$1" ]
    then source "$1"
    fi
}

