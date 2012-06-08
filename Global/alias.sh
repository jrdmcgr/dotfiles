# Reload .bashrc
alias rebash='. ~/.bashrc'

alias tailf="tail -f"
alias +x="chmod +x $1"

# Set the tab title in iTerm 2
function tt { echo -ne "\033];${1}\007"; }

genpasswd() {
	local l=$1
       	[ "$l" == "" ] && l=20
      	tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}
