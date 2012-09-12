PATH=$PATH:/usr/local/share/python/
PATH=$PATH:/usr/local/Cellar/gems/*/bin/
PATH=/usr/local/bin:$PATH

# This is specifically for the github Sublime Text plugin.
# It exports environment vars to GUI applications.
launchctl setenv PATH $PATH
