require 'rubygems'
require 'wirble'
require 'hirb'

puts "loading custom .irbrc..."

# load wirble
Wirble.init
Wirble.colorize

require 'ap'
require 'irb/completion'
require 'irb/ext/save-history'

def self.enable_hirb
  Hirb::View.enable
end

def self.disable_hirb
  Hirb::View.disable
end

IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:HISTORY_FILE] = "#{ENV['HOME']}/.irb_history"
IRB.conf[:PROMPT_MODE] = :SIMPLE
IRB.conf[:AUTO_INDENT] = true

class Object
  # list methods which aren't in superclass
  def local_methods(obj = self)
    (obj.methods - obj.class.superclass.instance_methods).sort
  end
  
  # print documentation
  #
  #   ri 'Array#pop'
  #   Array.ri
  #   Array.ri :pop
  #   arr.ri :pop
  def ri(method = nil)
    unless method && method =~ /^[A-Z]/ # if class isn't specified
      klass = self.kind_of?(Class) ? name : self.class.name
      method = [klass, method].compact.join('#')
    end
    puts `ri '#{method}'`
  end
end

def self.change_log(stream)
  ActiveRecord::Base.logger = Logger.new(stream)
  ActiveRecord::Base.clear_active_connections!
end
 
def self.show_log
  change_log(STDOUT)
end
 
def self.hide_log
  change_log(nil)
end

