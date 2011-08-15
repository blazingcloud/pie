class Foo
  attr_reader :bar

  def initialize(value)
    puts "initialize value= #{value}"
    setup(value)
  end

  def bar=(value)
    puts "bar= value= #{value}"    
    raise Exception, "5 not allowed" if value == 5
    @bar = value
  end

  def setup(value)
    puts "setup value= #{value}, #{self}"  
    self.bar=value
  end
private


  
end
