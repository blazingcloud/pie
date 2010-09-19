template :game_screen

place park:"You are in a park.  You see trees to the north and a path to the east"
place trees:"You are in a Japanese garden."
place river_edge:"The path ends at a river"
place in_the_river:"You walk into the river and drown."

park.path trees:north, river_edge:east
river_edge.path in_the_river:east!

image park:"images/park.JPG"
image river_edge:"images/water.JPG"
image trees:"images/trees.JPG"

