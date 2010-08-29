class Pie
  def self.image(image_hash)
    @@images ||= {}
    puts "--- set image"
    puts image_hash.inspect
    @@images.merge!(image_hash)
  end

  def self.place name, options
    @@places ||= {}
    @@places[name.to_sym] = options
  end

  def self.start(starting_place)
    puts "starting at #{starting_place}"
    $pie = new
    puts "$pie is #{$pie.inspect}"

    $current = starting_place
  end

  def current_image
    puts "------- current_image"
    puts $current.inspect
    puts @@images.inspect
    @@images[$current.to_sym]
  end

  def current_description
    puts "------- current_description"
    puts $current
    puts @@places
    place = @@places[$current.to_sym]
    place[:description] unless place.nil?
  end
end

