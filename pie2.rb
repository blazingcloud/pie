
class Pie
  class PlaceFactory
    def method_missing name, *args
      puts "making a #{name} with #{args[0].inspect}"

    end
  end

  def create_places(&block)
    @place_factory ||= PlaceFactory.new
    @place_factory.instance_eval(&block)
  end

end

def make_pie(&block)
  my_pie = Pie.new
  my_pie.instance_eval(&block)
end

make_pie do
  create_places do
    ship description:"ookina funa"
    building description:"ookina biru"
    tower description:"ookina towa"
  end
end
