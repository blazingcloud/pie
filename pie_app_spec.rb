$LOAD_PATH << File.dirname(__FILE__)
require 'pie'
require 'rack/test'

describe "app created with pie" do
    include Rack::Test::Methods

    def app
      Pie::WebApp
    end

    it "should say hello for the root path" do 
      get '/'
      last_response.body.should == "hello"
    end

    describe "with one place and an image" do
      before do
          make_pie do
            create_places do
              ship description:"ookina fune"
            end

            image ship:"images/big_ship.jpg" 
          end
      end
      #it "should display the ship page" do
      #  visit '/ship'
      #  page.should have_content('ookina fune')
      #end
    end


end
