require './slot'
require './register'

class VendingMachine
  attr_accessor :slots, :register, :item_count, :user_credit, :user_debt
  def initialize(slots)
    @register = Register.new()
    @slots = [] #no defined system so it will be built dynamically
    slots.each do |set|
      temp = []
      set.each do |key, value|
        temp.push(Slot.new(value))
      end
      @slots.push temp
    end
    @item_count = {} #no idea what the items are named so i will use a hash
  end

  def purchase(row, col, credit)
  end

  def change
    @user_credit - @user_debt
  end

  def selection(row, col)
    @user_debit ||= 0.0
    @user_debit += @slots[row][col].price
  end
end
