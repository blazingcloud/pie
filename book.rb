#encoding:UTF-8
$LOAD_PATH << File.dirname(__FILE__)
require 'lib/pie'

make_pie do
  create_places do
    ship description:"大きな船"
    building description:"ookina biru"
    tower description:"ookina tawaa"
  end

  image ship:"images/big_ship.jpg", 
        building:"images/building.jpg", 
        tower:"images/tokyo_tower.jpg" 
end


