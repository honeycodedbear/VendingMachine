require './slot'

class VendingMachine
  attr_accessor :slots, :item_count, :items_sold, :user_credit, :user_debt, :cash, :queue
  #Initialize the Vendingmachine with a hash of the different slots and their prices and its starting cash amount
  #Example VendingMachine.new({A1: 1, A2: 1, B1: 2, B2: 2}, 20)
  def initialize(slots, starting_cash)
    @cash = starting_cash
    #Already using a hash to initialize the grid why not use that as my data structure
    @slots = {}
    slots.each do |key, value|
      @slots[key] = Slot.new(value)
    end
    @item_count = {} #no idea what the items are named so i will use a hash
    @items_sold = {} #hash to store items sold
    @queue = [] #holds the order queue

  end
  #This method updates the Slot's stock adding them to the back of its queue. I imagined this as a back loading
  #vending machine but if you want a front loading one then change the Slot.sellItem method from @items.shift to @items.pop.
  #It will give you the desired result
  #This accepts a hash {Slotname => ["itemnames","itemnames"]} or {Slotname: "itemname"}
  def add_load(new_load)
    new_load.each do |key,value|
      if value.class == [].class
        value.each do |ele|
          @slots[key].addItem ele
          item_count[ele] ||= 0 #checks if that item already existed if is nil it will initialize
          item_count[ele] += 1
        end
      else #to handle hashes that don't pass arrary or items
        @slots[key].addItem value
        item_count[value] ||= 0
        item_count[value] += 1
      end
    end
  end
  def to_s
    @slots.map{|key,value|"#{key}=> #{value},\n"}.join
  end

  #Originally supported coins but noticed in the documentation you wanted no coin support.
  #the to_i method forces it to be an integer
  def insert_credit(new_credit)
    @user_credit ||= 0
    @user_credit += new_credit.to_i
  end

  #This method checks to see if the user has inserted enough credit to pay off their tab
  #If they have inserted enough credit it will then check if there is enough internal cash to
  #give them correct change
  #then it will dispense the sold items from their respected slots
  #It returns an array [[purchased, items, array], change]
  def despense
    if @user_credit >= @user_debt
      change = @user_credit - @user_debt
      if change <= @cash
        @user_credit = 0
        @user_debt = 0
        result = []
        @queue.each do |ele|
          temp = @slots[ele].sellItem
          result.push(temp)
          item_count[temp] -= 1
          items_sold[temp] ||= 0
          items_sold[temp] += 1
        end
        @queue = []
        return [result, change]
      else
        return "Error not enough change for transaction. Please consult admin"
      end
    else
      return "Not enough funds! #{@user_credit} < #{@user_debt}"
    end
  end

  #This method checks to see if a selected slot exists or if its empty. If it is valid it will add it to the queue
  def selection(coord)
    coord = coord.to_sym if coord.class == "".class
    #^^ to make sure it is a symbol not a string
    @user_debt ||= 0
    return "That slot doesn't exist! Please try another" unless @slots[coord]
    if @slots[coord].depth > 0
      @queue.push coord
      return "#{@user_debt += @slots[coord].price}"
    else
      return "Error Slot is empty! Try another one"
    end
  end

  #This method searches through the slots for the first occurence of a desired item.
  #If I had more time I would add every entry but this was a quick answer. It returns a hash
  #{Slotname: firstOccuryingIndexOfItem, Slotname2: aDifferentOccuryingIndexOfItem}
  def findItem(item)
    result = {}
    @slots.each do |key, value|
      index = value.items.find_index(item)
      result[key] = index if index #checks if it is nil
    end
    result
  end
end
