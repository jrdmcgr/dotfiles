echo "Loaded curriculog aliases."
function tablegrep { mysql jmcguire -e "show tables" | egrep ${1}; }
function trunctablegrep { for i in `tablegrep ${1}`; do mysql jmcguire -e "truncate table $i"; done; }
function tablediff { diff -u <(mysql ${1} -e 'show tables') <(mysql ${2} -e 'show tables') | vi -; }

alias mysqle='mysql jmcguire -e'
alias pykill='pkill -u jmcguire python'
