alias mysqle='mysql jmcguire -e'
alias pykill='pkill -u jmcguire python'

## MySQL data wrangling functions.
tablegrep() { mysql jmcguire -e "show tables" | egrep ${1}; }
trunctablegrep() { for i in `tablegrep ${1}`; do mysql jmcguire -e "truncate table $i"; done; }
tablediff() { diff -u <(mysql ${1} -e 'show tables') <(mysql ${2} -e 'show tables') | vi -; }
selectstar() { for args; do mysql jmcguire -e "select * from $args"; done; }


ddd() { 
	for args
	do 
		outfile=~/data/${args}_`date +%m%d%y`.sql
		latest=~/data/${args}_latest.sql
		mysqldump ${args} > $outfile
		ln -fs $outfile $latest
	done
}
