require 'rubygems'
require 'wirble'
# require 'utility_belt'    
require 'hirb'

# load wirble
Wirble.init
Wirble.colorize

require 'pp'
require 'irb/completion'

# Rails logger
def ar_logger
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

Hirb::View.enable

def disable_hirb
  Hirb::View.disable
end

