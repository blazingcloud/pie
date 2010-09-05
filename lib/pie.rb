require 'sinatra/base'
#puts "----------------- Ruby version = #{RUBY_VERSION}"
#raise ScriptError, "Pie requires Ruby 1.9 or higher" if RUBY_VERSION < "1.9.0"
NO_WAY_BACK = ""
class Pie 
  

  attr_accessor :places
  attr_accessor :images
  attr_accessor :default_template

  def initialize
    @default_template = :image_page
    @places = Places.new
    @map = Map.new(@places)
  end

  class WebApp < Sinatra::Base
    set :root, File.join(File.expand_path(File.dirname(__FILE__)), "..")

    get '/' do
      "hello"
    end

    get '/:place_name' do
      name = params[:place_name].to_sym
      $current = name unless name.nil?
      puts "current place name is #{$current}"
      puts "current place is #{$pie.places[$current]}"
      puts "--- skip out"; return if $pie.places[$current].nil?
      puts "current links are #{$pie.places[$current].links.inspect}"
      puts "displaying template: #{$pie.default_template.inspect}"
      erb $pie.default_template
    end
  end

  at_exit { WebApp.run! if !$0.include?("spec")}

  class Map

    def initialize places
      @places = places
    end

    def path endpoints
      puts "---> path #{endpoints.inspect}"
      puts @places.inspect
      #if h.size != 2
      #  return puts "path must have two and only two endpoints."
      #end
      start_place_key, end_place_key = endpoints.keys
      label_for_end, label_for_start = endpoints.values

      start_place =  @places[start_place_key]
      end_place =  @places[end_place_key]
      raise ArgumentError, "there is no place named '#{start_place_key}'" if start_place.nil?
      raise ArgumentError, "there is no place named '#{end_place_key}'" if end_place.nil?

      start_place[:links][end_place_key] = label_for_end unless label_for_end.empty?
      end_place[:links][start_place_key] = label_for_start unless label_for_start.empty?
    end
  end

  class Place < Hash
    def initialize
      self[:links] = {}
    end
    def links
      result = self[:links]
    end

  end

  class Places < Hash
    def method_missing name, options = {}
      unless options.is_a? Hash
        puts "options for creating a place must have key and value"
        return
      end
      puts "making a #{name} with #{options.inspect}"
      place = Place.new
      place.merge! options
      self[name.to_sym] = place
    end

    def [] string_or_symbol
      super string_or_symbol.to_sym
    end

    def after(place_name)
      index = keys.index(place_name.to_sym)
      next_place_name = keys[index + 1]
      self[next_place_name] unless next_place_name.nil?
    end

    def before(place_name)
      index = keys.index(place_name.to_sym)
      index = index - 1
      if index < 0
        nil
      else
        prev_place_name = keys[index]
        self[prev_place_name]
      end
    end
  end

  def template(template_name)
    puts "--> set default template #{template_name.to_sym}"
    @default_template = template_name.to_sym
  end

  def create_places(&block)
    @places.instance_eval(&block)
  end

  def map(&block)
    puts "-------- creating map --------"
    @map.instance_eval(&block)
  end

  def image(image_hash)
    @images ||= {}
    puts "--- set image"
    puts image_hash.inspect
    @images.merge!(image_hash)
  end

 def current_image
    puts "------- current_image"
    puts $current.inspect
    puts @images.inspect
    @images[$current.to_sym]
  end

  def current_description
    puts "------- current_description"
    puts $current.inspect
    place = @places[$current.to_sym]
    puts @place.inspect
    place[:description] unless place.nil?
  end
end

def make_pie(&block)
  puts "-------------------------- making pie ---------------------------- "
  $pie = Pie.new
  $pie.instance_eval(&block)
  puts "-------------------------- pie complete ---------------------------- "
end

def more_pie(&block)
  puts "-------------------------- more pie ---------------------------- "
  if $pie.nil?
    puts "How can you make more pie when you haven't made any pie yet?"
    return
  end
  $pie.instance_eval(&block)
  puts "-------------------------- pie complete ---------------------------- "
end
