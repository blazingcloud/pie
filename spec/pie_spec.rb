require File.join(File.expand_path(File.dirname(__FILE__)), "..", "lib", "pie")

include Pie

describe "baking pie" do
  
  describe "can access the current_place" do
    current_place.should == nil
    place ship:"this is a ship"
    current_place(:ship)
    current_place.should == ship
    place land:"this is land"
    current_place('land')
    current_place.should == land
  end
  
  describe "with template" do
    it "has a default template" do
      template.should == :image_page
    end
    it "can set an alternate template" do
      template :foo
      template.should == :foo
    end
  end
  describe "image declaration" do
    it "can declare an image" do
      image ship:"http://foo.com/ship.png"
      images[:ship].should == "http://foo.com/ship.png"
    end

    it "can declare multiple image statements" do
      image ship:"http://foo.com/ship.png"
      image basket:"http://foo.com/basket.png"
      images[:ship].should == "http://foo.com/ship.png"
      images[:basket].should == "http://foo.com/basket.png"
    end

    it "can declare multiple images with one statement" do
      image ship:"http://foo.com/ship.png",
            basket:"http://foo.com/basket.png"
      images[:ship].should == "http://foo.com/ship.png"
      images[:basket].should == "http://foo.com/basket.png"
    end
  end

  describe "creates places" do

    it "can create a place with extra options raises an error" do
      lambda {
        place ship:"this is a ship", extra_option:"this"
      }.should raise_error
    end

    it "can create a place with a description" do
      place ship:"this is a ship"
      ship.should be_a(Place)
      ship.name.should == :ship
      ship.description.should == "this is a ship"
    end

    describe "with paths" do
      before do
        place field:"You are in a large, grassy field. You see many trees to the north and a path to the east"
        place forest:"It is dark in the forest"
        place cliff_top:"The path ends at the top of a steep cliff"
        place cliff_bottom:"You walked off the cliff and fell to your death"
      end
      it "should have links between two places" do
        field.path forest:north
        field.paths.should == {forest:north}
        forest.paths.should == {field:south}
      end
      it "should have one way links" do
        cliff_top.path cliff_bottom:east!
        cliff_top.paths.should == {cliff_bottom:east}
        cliff_bottom.paths.should == {}
      end

      it "should support simple strings" do
        field.path cliff_bottom:"flying leap"
        field.paths[:cliff_bottom].should == "flying leap"
      end
    end

  end
  # describe "can access places" do
  #   before do
  #     ship description:"ookina fune"
  #     building description:"ookina biru"
  #     tower description:"ookina towa"
  #   end
  # 
  #   it "which are accessible by named key (symbol)" do
  #     ship = $pie.places[:ship]
  #     ship.should_not be_nil
  #     ship[:description].should == "ookina fune"
  #   end
  #   
  #   it "which are accessible by named key (string)" do
  #     ship = $pie.places["ship"]
  #     ship.should_not be_nil
  #     ship[:description].should == "ookina fune"
  #   end
  # 
  #   it "resulting in 2 places" do
  #     $pie.places.length.should == 3
  #   end
  #   
  #   it "and can find place after named place" do
  #     building = $pie.places.after(:ship)
  #     building.should_not be_nil
  #     building[:description].should == "ookina biru"
  #   end
  #  
  #   it "and finds nil after last place" do
  #     nothing = $pie.places.after(:tower)
  #     nothing.should be_nil
  #   end
  # 
  #   it "and can find place before named place" do
  #     building = $pie.places.before(:tower)
  #     building.should_not be_nil
  #     building[:description].should == "ookina biru"
  #   end
  # 
  #   it "and finds nil before first place" do
  #     nothing = $pie.places.before(:ship)
  #     nothing.should be_nil
  #   end
  # end
end
