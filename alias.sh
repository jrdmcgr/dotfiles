# Reload .bashrc
alias rebash='. ~/.bashrc'

alias tf="tail -f"
alias +x="chmod +x $1"

# Set the tab title in iTerm 2
function tt { echo -ne "\033];${1}\007"; }

genpasswd() {
	local l=$1
       	[ "$l" == "" ] && l=20
      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

# Use vim to read the man pages.
vman() {
   if [ $# -eq 0 ]; then
     /usr/bin/man
   else
     if man -w $* >/dev/null 2>/dev/null
     then
       /usr/bin/man $* | col -b | vim -R -c 'set ft=man nomod' -
     else
       echo No man page for $*
     fi
   fi
}

alias fn="find . -name"
alias sqlite="sqlite3"
alias ccat="pygmentize"
alias myfab="fab -f ~/fabfile.py"
alias apre="sudo apachectl restart"
alias ps="ps -eo pid,user,command"
alias serve="python -m SimpleHTTPServer"
