PATH=$HOME/bin
PATH=$PATH:/usr/local/bin:/usr/local/sbin
PATH=$PATH:/usr/local/share/python
PATH=$PATH:/usr/local/Cellar/gems/1.8/bin
PATH=$PATH:/usr/local/Cellar/ruby/1.9.3-p286/bin
PATH=$PATH:/usr/bin:/usr/sbin:/bin:/sbin

# Node modules
PATH=$PATH:/usr/local/share/npm/bin
# Heroku
PATH=$PATH:/usr/local/heroku/bin

export PATH
export PYTHONPATH='/usr/local/lib/python2.7/site-packages'
export NODE_PATH='/usr/local/share/npm/lib/node_modules'

# This is specifically for the github Sublime Text plugin.
# It exports environment vars to GUI applications.
launchctl setenv PATH $PATH
