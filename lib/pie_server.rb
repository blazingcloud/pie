require 'sinatra/base'

class WebApp < Sinatra::Base
  set :root, File.join(File.expand_path(File.dirname(__FILE__)), "..")

  get '/' do
    "hello"
  end

  get '/:place_name' do
    puts "============================================"
    puts "settings.pie_data = #{settings.pie_data.inspect}"
    
    pie ||= settings.pie_data
    pie ||= request.env["PIE_DATA"]
    puts "pie = #{pie.inspect}"
      name = params[:place_name].to_sym
      pie.current_place(name) unless name.nil?
      puts "current place name is #{pie.current_place.name}"
      puts "current place is #{pie.current_place.description}"
      puts "--- skip out"; return if pie.current_place.nil?
      puts "current links are #{pie.current_place.paths.inspect}"
      puts "displaying template: #{pie.template.inspect}"
      erb pie.template, {}, {:pie => pie}
  end

end
