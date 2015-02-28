require './slot'
require './register'

class VendingMachine
  attr_accessor :slots, :register
  def initialize()
    @register = Register.new()
    @slots = []
  end
end
