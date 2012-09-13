home_prompt() {
	# If we're home then use a simple prompt.
	if [ `pwd` == $HOME ]; then 
		PS1=' \[\e[0;32m\]⚡\[\e[0m\] '
	# Check for git bash completion on Mac.
	elif [ -f /usr/local/etc/bash_completion.d/git-completion.bash ]; then
		. /usr/local/etc/bash_completion.d/git-completion.bash;
		PS1='〈 \w$(__git_ps1 " ± %s") 〉\[\e[0;32m\]⚡\[\e[0m\]  '
	# Check for git bash completion on Linux.	
	elif [ -f /etc/bash_completion.d/git ]; then
		. /etc/bash_completion.d/git;
		PS1='〈 \w$(__git_ps1 " ± %s") 〉\[\e[0;32m\]⚡\[\e[0m\]  '
	# Display the standard prompt.
	else
		PS1='〈 \w 〉\[\e[0;32m\]⚡\[\e[0m\]  '
	fi
}

PROMPT_COMMAND=home_prompt



local         BLACK="\[\033[0;30m\]"
local           RED="\[\033[0;31m\]"
local         GREEN="\[\033[0;32m\]"
local        YELLOW="\[\033[0;33m\]"
local          BLUE="\[\033[0;34m\]"
local       MAGENTA="\[\033[0;35m\]"
local          CYAN="\[\033[0;36m\]"
local    LIGHT_GRAY="\[\033[0;37m\]"
local     LIGHT_RED="\[\033[1;31m\]"
local   LIGHT_GREEN="\[\033[1;32m\]"
local  LIGHT_YELLOW="\[\033[1;33m\]"
local    LIGHT_BLUE="\[\033[1;34m\]"
local LIGHT_MAGENTA="\[\033[1;35m\]"
local    LIGHT_CYAN="\[\033[1;36m\]"
local         WHITE="\[\033[1;37m\]"
local    COLOR_NONE="\[\e[0m\]"

