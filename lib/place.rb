class Pie::Place
  
  attr_reader :name, :description, :paths
  
  def initialize(options)
    @paths = {}
    extract_standard_options(options)
    extract_name_and_description(options)
  end
  
  def to_s
    @name
  end

  def path(nodes)
    nodes.each do |place_name, direction|
      paths[place_name] = direction
      Pie.places[place_name].paths[name] = direction.opposite unless  !direction.respond_to?(:dead_end?) || direction.dead_end? 
    end
  end
  
  private
  
  def extract_name_and_description(options)
    raise "You seem to have extras option in this place!" unless options.length == 1
    @name = options.keys.first
    @description = options.values.first
  end
  
  def extract_standard_options(options)
  end
end
