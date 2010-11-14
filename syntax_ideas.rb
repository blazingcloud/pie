# Draft 1

create_places do
 cave description:"You are in a big cave", connects_to: { forest:"Go out"}
 forest description:"The forest is very dark", connects_to: { cave:"North", cliff:"East"}
 cliff description:"There is a sheer cliff that is too steep to climb", connects_to: { forest:"East"}
end

create_player do
  evolve [egg:forest, rabbit:cave, smurf, wizard, warrior]
end

images {
	cave:"http://flickr.com/trees.jpg", 
	forest:"http://flickr.com/forest.jpg", 
	cliff:"http://flickr.com/something.jpg", 
	egg:"http://flickr.com/egg.jpg", 
	rabbit:"http://ultrasaurus.com/photos/rabbit.png"
	...
}

start forest


# Draft 2 -- implicit next/prev, images with nicer syntax (or maybe not)

create_places do
 ship description:"ookina funa"
 building description:"ookina biru"
 tower description:"ookina towa"
end

image ship:"http://flickr.com/trees.jpg", 
	building:"http://flickr.com/forest.jpg", 
	tower:"http://flickr.com/something.jpg", 

sounds {
  ship:"ookina-foona.wav",
  building:"biru.wav",
  tower:"towa.wav"
}

# First implementation

make_pie do
  create_places do
    ship description:"大きな船"
    building description:"ookina biru"
    tower description:"ookina towa"
  end

  image ship:"images/big_ship.jpg", 
        building:"images/building.jpg", 
        tower:"images/tokyo_tower.jpg" 
end

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

# Need to write code to report nicer errors
# method_missing makes for weird errors

    it "cannot create a place if options are invalid (given as a symbol not a Hash)" do
      make_pie do
        create_places do
          result = ship :invalid
          result.should == nil
        end
      end
      $pie.places[:ship].should == nil
    end

    def method_missing name, options = {}
      unless options.is_a? Hash
        puts "options for creating a place must have key and value"
        return
      end

# Issues: 
* image syntax is sensitive to space and this won't work:
  image park :"images/park.JPG"
* creating two-way connections, which are common is cumbersome
* want to keep game logic in one place and as concise as possible

Solution:

map do
  path {cave:"go into the forest", forest:"enter tunnel"}
  path {cave:"step into hole", hole:no_way_back}
end




