module Pie
  
  def self.[](key)
    (@map ||= {})[key]
  end

  def self.[]=(key, value)
    (@map ||= {})[key] = value
  end

  def self.language=(language)
    @language = language
  end
  
  def self.localized(id)
    @values ||= {
      :japanese => {
        :go_north => "Go North (in jp!)",
        :go_south => "Go South (in jp!)",
        :go_east => "Go East (in jp!)",
        :go_west => "Go West (in jp!)"
      },
      :english => {
        :go_north => "Go North",
        :go_south => "Go South",
        :go_east => "Go East",
        :go_west => "Go West"
      }
    }
    @values[@language || :english][id]
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
  
  def language(language)
    Pie.language = language
  end
  
end

require 'place'
require 'direction'