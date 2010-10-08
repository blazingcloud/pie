$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "."))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "lib"))
require 'lib/pie'

# interactive example of calling pie from a rack app
# run on the command line with
#   rackup rack_example.ru
# then go to localhost:9292

module Pie
  class Rack
    include Pie

    def call(env)

        place :park =>'this is a park'

        ["200",{"Content-Type" => "text/plain"}, [park.description]] 
     
    end
  end
end
    
run Pie::Rack.new

