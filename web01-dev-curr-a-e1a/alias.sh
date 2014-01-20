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

dump-data() { 
	for args; do 
		outfile=~/data/${args}-`date +%Y-%m-%d-%H:%M%S`.sql
		latest=~/data/${args}-latest.sql
		mysqldump ${args} > $outfile
		ln -fs $outfile $latest
	done
}

load-latest() {
    while (( "$#" )); do
        if [[ ${1:0:1} == "-" ]]; then
            INDEX=$1
        else
            DATABASE=$1
        fi
        shift
    done
    DATABASE=${DATABASE:-jmcguire}
    IDX=${INDEX:1}
    INDEX=${IDX:-1}
    
    DUMPS=(`ls ${HOME}/data/${DATABASE}-* | sort -r`)
    LATEST=${DUMPS[$INDEX]}
    
    # echo "DATABASE: ${DATABASE}"
    # echo "INDEX: ${INDEX}"
    # echo "LATEST: ${LATEST}"

    mysql $DATABASE < $LATEST
}

