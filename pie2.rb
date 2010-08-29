require 'sinatra/base'

class Pie 
  class WebApp < Sinatra::Base
    set :root, File.dirname(__FILE__)

    get '/' do
      "hello"
    end

    get '/:place_name' do
      name = params[:place_name]
      $current = name unless name.nil?
      erb :image_page
    end
  end

  at_exit { puts "exit"; WebApp.run! }

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

 def current_image
    puts "------- current_image"
    puts $current.inspect
    puts @images.inspect
    @images[$current.to_sym]
  end

  def current_description
    puts "------- current_description"
    puts $current
    puts @places
    place = @places[$current.to_sym]
    place[:description] unless place.nil?
  end
end

