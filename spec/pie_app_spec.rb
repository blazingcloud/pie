$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__)), "..", "lib")
require 'pie'
require 'pie_server'
require 'capybara'
require 'capybara/dsl'

describe "app created with pie" do
  include Capybara
  include Pie

  before do
    Capybara.app = Pie::WebApp
  end

  describe "root path" do
    before do
      place ship:"ookina fune"
    end
    it "should visit the first place in the list" do
      visit '/'
      page.should have_content('ookina fune')
    end
  end

  describe "with one place and an image" do
    before do
      place ship:"ookina fune"
      image ship:"images/big_ship.jpg"
    end
    it "should display the ship page" do
      visit '/ship'
      page.should have_content('ookina fune')
    end
  end

  describe "with two places and images" do
    before do
      place ship:"ookina fune"
      place building:"ookina biru"
      image ship:"images/big_ship.jpg"
      image building:"images/building.jpg"
    end
    it "should display the next button" do
      visit '/ship'
      page.should have_content('next')
    end
  end
end
