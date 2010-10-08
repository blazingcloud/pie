require 'sinatra/base'

class WebApp < Sinatra::Base
  set :root, File.join(File.expand_path(File.dirname(__FILE__)), "..")

  get '/' do
    "hello"
  end

  get '/:place_name' do
    puts "============================================"
    thing ||= $thing
    thing ||= request.env["PIE_THING"]
    puts "thing = #{thing.inspect}"
      name = params[:place_name].to_sym
      thing.current_place(name) unless name.nil?
      puts "current place name is #{thing.current_place.name}"
      puts "current place is #{thing.current_place.description}"
      puts "--- skip out"; return if thing.current_place.nil?
      puts "current links are #{thing.current_place.paths.inspect}"
      puts "displaying template: #{thing.template.inspect}"
      erb thing.template, {}, {:thing => thing}
  end

end
