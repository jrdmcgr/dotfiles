home_prompt() {
	if [ "$(pwd)" == $HOME ]; then 
		PS1=' \[\e[0;32m\]⚡\[\e[0m\] '
	elif [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
		. /usr/local/etc/bash_completion.d/git-completion.bash;
		PS1='〈 \w$(__git_ps1 " ±%s") 〉\[\e[0;32m\]⚡\[\e[0m\]  '
	else
		PS1='〈 \w 〉\[\e[0;32m\]⚡\[\e[0m\]  '
	fi
}

PROMPT_COMMAND=home_prompt


