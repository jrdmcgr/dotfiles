# Reload .bashrc
alias rebash='. ~/.bashrc'
alias tf="tail -f"
alias +x="chmod +x $1"
alias fn="find . -name"
alias sqlite="sqlite3"
alias ccat="pygmentize"
alias myfab="fab -f ~/fabfile.py"
alias apre="sudo apachectl restart"
alias ps="ps -eo pid,user,command"
alias serve="python -m SimpleHTTPServer"
alias isodate="date -u +%FT%TZ"

# Set the tab title in iTerm 2
function tt() { 
  echo -ne "\033];${1}\007";
}

# Make directory and change into it.
function mcd() {
  mkdir -p "$1" && cd "$1";
}