require './vendingmachine'

test_set_1 = {A1: 1.00, A2: 1.00, B1: 1.50, B2: 1.50}
vm = VendingMachine.new(test_set_1, 20.00)
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
puts "#{vm.insert_credit(1.00)}"
puts "#{vm.despense}"
puts "#{vm.insert_credit(1.25)}"
puts "#{vm.despense}"
