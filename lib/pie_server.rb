require 'sinatra/base'

class Pie::WebApp < Sinatra::Base
  set :root, File.join(File.expand_path(File.dirname(__FILE__)), "..")

  get '/*' do
    puts "env= #{request.env.inspect}"
    puts "request.env[PIE_DATA]= #{request.env["PIE_DATA"].inspect}"
    pie ||= request.env["PIE_DATA"] || settings.pie_data
    puts "pie = #{pie.inspect}"
    if pie
      splat = params[:splat].find { |e| e.length > 0 }
      name = (splat || settings.pie_data.places.first.first).to_sym
      pie.current_place(name) unless name.nil?
      puts "current place name is #{pie.current_place.name}"
      puts "current place is #{pie.current_place.description}"
      puts "--- skip out"; return if pie.current_place.nil?
      puts "current links are #{pie.current_place.paths.inspect}"
      puts "displaying template: #{pie.template.inspect}"
      erb pie.template, {}, {:pie => pie}
    else 
      puts "NO PIE! AAAAAH!"
    end
  end

end
