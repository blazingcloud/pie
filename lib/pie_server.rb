require 'sinatra/base'

class WebApp < Sinatra::Base
  set :root, File.join(File.expand_path(File.dirname(__FILE__)), "..")

  get '/' do
    "hello"
  end

  get '/:place_name' do
    name = params[:place_name].to_sym
    puts "going to place with name #{name}"
    current_place(name) unless name.nil?
    puts "current place name is #{current_place.name}"
    puts "current place is #{current_place.description}"
    puts "--- skip out"; return if current_place.nil?
    puts "current links are #{current_place.paths.inspect}"
    puts "displaying template: #{template.inspect}"
    erb template
  end
end
