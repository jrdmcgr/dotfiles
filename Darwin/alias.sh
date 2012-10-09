alias vbox='VBoxManage'
alias ll='ls -laFGL'
alias ip="ipconfig getifaddr en0"

# Edit a remote file with Sublime Text.
sublr() {
	filename=$(echo $1 | egrep -o '[a-zA-Z\.\-]*$') &&
	scp $1 ./ && 
	subl -w ./$filename &&
	scp ./$filename $1
}
