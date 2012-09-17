PATH=/usr/local/bin:/usr/local/sbin
PATH=$PATH:/usr/local/share/python/
PATH=$PATH:/usr/local/Cellar/gems/1.8/bin/
PATH=$PATH:/usr/bin:/usr/sbin:/bin:/sbin

# This is specifically for the github Sublime Text plugin.
# It exports environment vars to GUI applications.
launchctl setenv PATH $PATH
