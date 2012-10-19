# Some default enhancements/settings for IRB, based on
# http://wiki.rubygarden.org/Ruby/page/show/Irb/TipsAndTricks

unless defined? ETC_IRBRC_LOADED
  # Require RubyGems by default.
  require 'rubygems'

  # Activate auto-completion.
  require 'irb/completion'

  require 'wirble'
  Wirble.init
  Wirble.colorize

  # Use the simple prompt if possible.
  IRB.conf[:PROMPT_MODE] = :SIMPLE if IRB.conf[:PROMPT_MODE] == :DEFAULT
end

