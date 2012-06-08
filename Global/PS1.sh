home_prompt() {
	# If we're home then use a simple prompt.
	if [ "$(pwd)" == $HOME ]; then 
		PS1=' \[\e[0;32m\]⚡ \[\e[0m\] '
	# Check for git bash completion on Mac.
	elif [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
		. /usr/local/etc/bash_completion.d/git-completion.bash;
		PS1='〈\w$(__git_ps1 " ±%s") 〉\[\e[0;32m\]⚡\[\e[0m\]  '
	# Check for git bash completion on Linux.	
	elif [ -f /etc/bash_completion.d/git ]; then
		. /etc/bash_completion.d/git;
		PS1='〈 \w$(__git_ps1 " ±%s") 〉\[\e[0;32m\]⚡\[\e[0m\]  '
	 # Display the standard prompt.
	else
		PS1='〈 \w 〉\[\e[0;32m\]⚡\[\e[0m\]  '
	fi
}

PROMPT_COMMAND=home_prompt


