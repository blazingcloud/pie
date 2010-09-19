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
    @north ||= direction('Go North', 'Go South')
  end
  def south
    @south ||= direction('Go South', 'Go North')
  end
  def east
    @east ||= direction('Go East', 'Go West')
  end
  def west
    @west ||= direction('Go West', 'Go East')
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
