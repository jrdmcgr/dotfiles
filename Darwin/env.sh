export GEM_HOME='/usr/local/Cellar/gems/1.8'

# This is specifically for the github Sublime Text plugin.
# It exports environment vars to GUI applications.
launchctl setenv PATH $PATH
launchctl setenv GITHUB_USER $GITHUB_USER
launchctl setenv GITHUB_TOKEN $GITHUB_TOKEN