require './slot'
require './register'

class VendingMachine
  attr_accessor :slots, :register, :item_count, :user_credit, :user_debt
  def initialize(slots)
    @register = Register.new()
    #@slots = [] #no defined system so it will be built dynamically
    #Already using a hash to initialize the grid why not use that as my data structure
    @slots = {}
    slots.each do |key, value|
      @slots[key] = Slot.new(value)
    end
    @item_count = {} #no idea what the items are named so i will use a hash
  end
  def add_load(new_load)
    new_load.each do |key,value|
      if value.class == [].class
        value.each do |ele|
          @slots[key].addItem ele
          item_count[ele] ||= 0
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

  def change
    @user_credit - @user_debt
  end

  def selection(coord)
    @user_debit ||= 0.0
    @user_debit += @slots[coord].price
  end
end
