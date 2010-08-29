require 'pie'

class Book < Pie
  place :title, description:"This is a book about big things"
  place :ship, description:"ookina funa"
  place :building, description:"ookina biru"
  place :tower, description:"ookina towa"

  image ship:"big_ship.jpg", 
        building:"big_building.jpg", 
        tower:"tokyo_tower.jpg", 
end
Book.new.start(:title)
