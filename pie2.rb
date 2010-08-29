
class Pie
  attr_accessor :places
  class Places < Array
    def method_missing name, *args
      puts "making a #{name} with #{args[0].inspect}"
      self << {name.to_sym => args[0]}
    end
  end

  def create_places(&block)
    @places ||= Places.new
    @places.instance_eval(&block)
  end

  def image(image_hash)
    @images ||= {}
    puts "--- set image"
    puts image_hash.inspect
    @images.merge!(image_hash)
  end

end

def make_pie(&block)
  $pie = Pie.new
  $pie.instance_eval(&block)
end

make_pie do
  create_places do
    ship description:"ookina funa"
    building description:"ookina biru"
    tower description:"ookina towa"
  end

  image :ship => "images/big_ship.jpg", 
        :building => "images/building.jpg", 
        :tower => "images/tokyo_tower.jpg" 
end
