require 'rubygems'
require 'wirble'
require 'utility_belt'    

# load wirble
Wirble.init
Wirble.colorize

require 'pp'
require 'irb/completion'

# Rails logger
def ar_logger
  ActiveRecord::Base.logger = Logger.new(STDOUT)
end

