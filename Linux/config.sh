# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
    PS1='〈 \w$(__git_ps1 " ± %s") 〉\[\e[0;32m\]⚡\[\e[0m\]  '
fi
