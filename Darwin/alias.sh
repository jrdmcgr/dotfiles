alias vbox='VBoxManage'
alias ll='ls -laFG'

# Edit a remote file with Sublime Text.
sublr() {
	filename=$(echo $1 | egrep -o '[a-zA-Z\.\-]*$') &&
	scp $1 ./ && 
	subl -w ./$filename &&
	scp ./$filename $1
}

# Print this machine's LAN IP and copy it to the clipboard.
myip() { 
	IP=$(ifconfig | awk '/inet 192/ { print $2 }')
	echo $IP
	echo -n $IP | pbcopy
}


