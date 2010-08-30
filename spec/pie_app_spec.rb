$LOAD_PATH << File.join(File.expand_path(File.dirname(__FILE__)), "..", "lib")
require 'pie'
require 'capybara'
require 'capybara/dsl'

describe "app created with pie" do
  include Capybara

  before do
    Capybara.app = Pie::WebApp
  end

  it "should say hello for the root path" do
    visit '/'
    page.should have_content "hello"
  end

  describe "with one place and an image" do
    before do
      puts "in before"
      make_pie do
        puts "in make pie"
        create_places do
          puts "in create places"
          ship description:"ookina fune"
          puts "made a ship!"
        end
        puts "about to add an image"
        image ship:"images/big_ship.jpg"
      end
    end
    it "should display the ship page" do
      visit '/ship'
      page.should have_content('ookina fune')
    end
  end

  describe "with two places and images" do
    before do
      make_pie do
        create_places do
          ship description:"ookina fune"
          building description:"ookina biru"
        end
        image ship:"images/big_ship.jpg"
        image building:"images/building.jpg"
      end
    end
    it "should display the next button" do
      visit '/ship'
      page.should have_content('next')
    end
  end
end
