PS1='〈 \w  〉\[\e[0;32m\]⚡\[\e[0m\]  '

if [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
	. /usr/local/etc/bash_completion.d/git-completion.bash;
	PS1='〈 \w  〉$(__git_ps1 "%s") \n \[\e[0;32m\]⚡\[\e[0m\]  '
fi
