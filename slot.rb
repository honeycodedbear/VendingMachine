
class Slot
  attr_accessor :items, :price
  def initialize(price)
    @items = [] #an array that holds the String name of each 'item'
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
    #this pops off the first item and returns it
    @items.shift
    #if you want it to be a front loading vending machine change .shift to .pop
  end
  def to_s #defining a new toString method so we can use it in the string Interpolation
    "Price: #{price}, Depth: #{depth}, Items: #{@items}"
  end
end
