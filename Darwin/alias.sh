alias vbox='VBoxManage'
alias ll='ls -laFG'

function sublr {
	filename=$(echo $1 | egrep -o '[a-zA-Z\.\-]*$') &&
	scp $1 ./ && 
	subl -w ./$filename &&
	scp ./$filename $1
}
