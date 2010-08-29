require 'rubygems'
require 'sinatra'
class Pie
  def image
    @images ||= {}
    @images.merge(yield) if block_given?
  end

  def place name, options
    @places ||= {}
    @places[name] = options
  end

  def start(starting_place)
    $pie = this
    $current = starting_place
  end

  def render(place_name)
    @image = @images[:place_name]
    @description = @places[:place_name][:description]
    erb :image_page
  end
end

get "/" do
   $pie.render($current)
end

get "/:place_name" do
  $current = params[:place_name]
end
