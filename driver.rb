require './vendingmachine'

test_set_1 = {A1: 1, A2: 1, B1: 2, B2: 2}
vm = VendingMachine.new(test_set_1, 20)
puts "#{vm}"

first_load = {A1: ['Skittles', 'M&M', 'Skittles']}
vm.add_load(first_load)
puts "\n#{vm}"
#puts "#{vm.cash}"

#puts "#{vm.selection(:A1)}"
#puts "#{vm.selection(:A2)}"
#puts "#{vm.selection(:A1)}"

puts "#{vm.selection(:A1)}"
puts "#{vm.selection(:A1)}"
puts "#{vm.insert_credit(1)}"
puts "#{vm.despense}"
puts "#{vm.insert_credit(2)}"
puts "#{vm.despense}"
