require './slot'

class VendingMachine
  attr_accessor :slots, :item_count, :user_credit, :user_debt, :cash, :queue
  def initialize(slots, starting_cash)
    @cash = starting_cash
    #Already using a hash to initialize the grid why not use that as my data structure
    @slots = {}
    slots.each do |key, value|
      @slots[key] = Slot.new(value)
    end
    @item_count = {} #no idea what the items are named so i will use a hash
    @queue = [] #holds the order queue
  end
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

  def insert_credit(new_credit)
    @user_credit ||= 0
    @user_credit += new_credit.to_i
  end

  def despense
    if @user_credit >= @user_debt
      change = @user_credit - @user_debt
      if change <= @cash
        @user_credit = 0
        @user_debit = 0
        result = []
        @queue.each do |ele|
          result.push(@slots[ele].sellItem)
        end

        return [result, change]
      else
        return "Error not enough change for transaction. Please consult admin"
      end
    else
      return "Not enough funds! #{@user_credit} < #{@user_debt}"
    end
  end

  def selection(coord)
    coord = coord.to_sym if coord.class == "".class
    #^^ to make sure it is a symbol not a string
    @user_debt ||= 0
    if @slots[coord].depth > 0
      @queue.push coord
      return "#{@user_debt += @slots[coord].price}"
    else
      return "Error Slot is empty! Try another one"
    end
  end
end
