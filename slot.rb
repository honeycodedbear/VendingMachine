
class Slot
  attr_accessor :items, :price
  def initialize(price)
    @items = []
    @price = price
  end
  def depth
    @items.size
  end
  def addItem(item)
    #add item to the back of the queue
    @items.push item
  end
  def sellItem
    #this pops off the first item
    @items.shift
  end
  def to_s #defining a new toString method so we can use it in the string Interpolation
    "Price: #{price}, Depth: #{depth}, Items: #{@items}"
  end
end
