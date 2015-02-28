require './vendingmachine'

test_set_1 = {A1: 1.00, A2: 1.00, B1: 1.50, B2: 1.50}
vm = VendingMachine.new(test_set_1)
puts "#{vm}"

first_load = {A1: ['Skittles', 'M&M', 'Skittles']}
vm.add_load(first_load)
puts "\n#{vm}"
