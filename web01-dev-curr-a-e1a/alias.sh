alias mysqle='mysql jmcguire -e'
alias pykill='pkill -u jmcguire python'

## MySQL data wrangling functions.
tablegrep() { mysql jmcguire -e "show tables" | egrep ${1}; }
tablediff() { diff -u <(mysql ${1} -e 'show tables') <(mysql ${2} -e 'show tables') | vi -; }

trunctablegrep() { 
    for table; do
        for i in `tablegrep $table`; do 
            mysql jmcguire -e "truncate table $i"
        done
    done
}

ddd() { 
	for args; do 
		outfile=~/data/${args}_`date +%m%d%y`.sql
		latest=~/data/${args}_latest.sql
		mysqldump ${args} > $outfile
		ln -fs $outfile $latest
	done
}
