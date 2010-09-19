module Pie

  class DeadEnd < String
    def dead_end?
      true
    end
  end
  
  class Direction < String
    def opposite(display_name = nil)
      if display_name
        @display_name = display_name
      else 
        @display_name
      end
    end
    def dead_end?
      false
    end
  end
  
  def direction(forward, back)
    dir = Direction.new(forward)
    dir.opposite(back)
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
  def dead_end(name)
    DeadEnd.new(name)
  end
  def north!
    dead_end(north)
  end
  def south!
    dead_end(south)
  end
  def east!
    dead_end(east)
  end
  def west!
    dead_end(west)
  end
end
