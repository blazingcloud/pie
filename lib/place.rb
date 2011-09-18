class Pie::Place
  
  attr_accessor  :description
  attr_reader :name, :paths
  
  def initialize(places, options)
    @paths = {}
    @places = places
    
    extract_standard_options(options)
    extract_name_and_description(options)
    @places[@name] = self
  end
  
  def to_s
    @name
  end

  def path(nodes)
    nodes.each do |place_name, direction|
      place = @places[place_name]
      raise "#{place_name} is not a place" if place.nil?
      
      @paths[place_name] = direction
      @places[place_name].paths[name] = direction.opposite unless  !direction.respond_to?(:dead_end?) || direction.dead_end?
    end
  end
  
  private
  def extract_name_and_description(options)
    raise "You seem to have extras option in this place!" unless options.length == 1
    self.name = options.keys.first
    @description = options.values.first
  end
  
  def extract_standard_options(options)
  end

  def name=(name)
    valid = false
    begin
      result = eval name.to_s
      # if there is no exception, it's a problem like String or something Ruby knows
      
    rescue NameError
      # this is what we want, so that method_missing will be called if we use this as a place name
      valid = true
      
    rescue SyntaxError => e
      msg = case e.message
        when  /syntax error, unexpected \$end/
          "#{e.message}\n"+
          "Sorry, You can't name a place 'class' "+
          "because Ruby was expecting you to define a 'class' "+
          "which is always followed by an 'end'"
        when  /syntax error, unexpected keyword/
          "#{e.message}\nSorry, you can't name a place with a Ruby keyword, like '#{name}'"
        else
          # don't have an example where this happens, but I would guess there is one
          "#{e.message}\nSorry, Ruby doesn't think that '#{name}' makes sense as the name of a place."

      end

     
      raise e.class, msg
      
    rescue ArgumentError => e
      msg = "#{e.message}\n"+
                  "You probably weren't trying to argue with Ruby, but it recognized '#{name}' and expected it to be followed by "+
                  "some more input, which it calls 'arguments'. Sorry '#{name}' can't be a place name."
      raise e.class, msg

    rescue Exception => e
      # other kinds of inappropriate names
      msg = "#{e.message}\nSorry, you can't name a place with something like '#{name}'"
      raise e.class, msg
    end
    
    if !valid
      raise("Sorry, you can't name a place with a name that Ruby already knows like '#{name}'")
    end
    
    @name = name
  end

  
end
