$LOAD_PATH << File.dirname(__FILE__)
require 'lib/pie'

def make_pie(&block)
  $pie = Pie.new
  $pie.instance_eval(&block)
end

make_pie do
  create_places do
    ship description:"ookina fune"
    building description:"ookina biru"
    tower description:"ookina towa"
  end

  image ship:"images/big_ship.jpg", 
        building:"images/building.jpg", 
        tower:"images/tokyo_tower.jpg" 
end


