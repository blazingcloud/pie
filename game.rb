$LOAD_PATH << File.dirname(__FILE__)
require 'lib/pie'

make_pie do
  template :game_screen

  create_places do
    park description:"You are in a park.  You see trees to the north and a path to the east", links:{trees:"North", river_edge:"East"} 
    trees description:"You are in a Japanese garden.", links:{park:"South"}
    river_edge description:"The path ends at a river", links:{in_the_river:"East", park:"West"}
    in_the_river description:"You walk into the river and down"
  end

  image park:"images/park.JPG"
  image river_edge:"images/water.JPG"
  image trees:"images/trees.JPG"
end
