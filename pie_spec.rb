require File.expand_path(File.dirname(__FILE__) + '/pie')

describe "making pie" do

  it "can declare an image" do
    make_pie do
      image ship:"http://foo.com/ship.png"
    end
    $pie.images.should == {ship:"http://foo.com/ship.png"}
  end

  it "can declare multiple image statements" do
    make_pie do
      image ship:"http://foo.com/ship.png"
      image basket:"http://foo.com/basket.png"
    end
    $pie.images.should == {ship:"http://foo.com/ship.png",
                      basket:"http://foo.com/basket.png"}
  end

  it "can declare multiple images with one statement" do
    make_pie do
      image ship:"http://foo.com/ship.png",
          basket:"http://foo.com/basket.png"
    end
    $pie.images.should == {ship:"http://foo.com/ship.png",
                      basket:"http://foo.com/basket.png"}
  end

end
