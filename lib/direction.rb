module Pie
  
  class Direction < String
    
    def opposite(opposite_name = nil)
      if opposite_name
        @opposite_name = opposite_name
      else 
        @opposite_name
      end
    end
    def dead_end?
      @opposite_name.nil?
    end
  end
  
  def direction(forward, back = nil)
    dir = Direction.new(forward)
    dir.opposite(back) if back
    dir
  end
  
  def north
    @north ||= direction(Pie.localized(:go_north), Pie.localized(:go_south))
  end
  def south
    @south ||= direction(Pie.localized(:go_south), Pie.localized(:go_north))
  end
  def east
    @east ||= direction(Pie.localized(:go_east), Pie.localized(:go_west))
  end
  def west
    @west ||= direction(Pie.localized(:go_west), Pie.localized(:go_east))
  end
  def north!
    direction(north)
  end
  def south!
    direction(south)
  end
  def east!
    direction(east)
  end
  def west!
    direction(west)
  end
end
