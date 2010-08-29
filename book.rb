$LOAD_PATH << File.dirname(__FILE__)
require 'pie'
require 'rubygems'
require 'sinatra'


class Book < Pie
  place :title, :description => "This is a book about big things"
  place :ship, :description =>"ookina funa"
  place :building, :description => "ookina biru"
  place :tower,:description => "ookina towa"

  image :ship => "images/big_ship.jpg", 
        :building => "images/building.jpg", 
        :tower => "images/tokyo_tower.jpg" 
end
Book.start(:ship)

get "/:place_name" do
    puts "$pie is #{$pie.inspect}"

  name = params[:place_name]
  $current = name unless name.nil?
  erb :image_page
end


