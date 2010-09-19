module Pie
  
  def self.[](key)
    (@map ||= {})[key]
  end

  def self.[]=(key, value)
    (@map ||= {})[key] = value
  end
  
  def template(name = nil)
    if name
      Pie[:template] = name.to_sym
    else
      Pie[:template] || :image_page
    end
  end
  
  def images
    Pie[:images] ||= {}
  end
  
  def image(image_maps)
    images.merge!(image_maps)
  end

  def place(options)
    Place.new(options)
  end
  
  def current_place(name=nil)
    puts "current_place"
    puts places.inspect
    if name
      Pie[:current_place] = places[name.to_sym]
    else
      Pie[:current_place]
    end
  end
  
  def current_image
    images[current_place.name] if current_place
  end
  
  def places
    Pie[:places] ||= {}
  end
  
end

require 'place'
require 'direction'
