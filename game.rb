$LOAD_PATH << File.dirname(__FILE__)
require 'lib/pie'

make_pie do
  template :game_screen

  create_places do
    park description:"You are in a park.  You see trees to the north and a path to the east"
    trees description:"You are in a Japanese garden."
    river_edge description:"The path ends at a river"
    in_the_river description:"You walk into the river and drown."
  end

  map do 
    path(park:"North", trees:"South")
    path(park:"East", river_edge:"West")
    path(river_edge:"East", in_the_river:NO_WAY_BACK)
  end

  image park:"images/park.JPG"
  image river_edge:"images/water.JPG"
  image trees:"images/trees.JPG"
end
