<h1>Vending Machine</h1>

<h3> How to Run </h3>
Have Ruby installed on your machine.

Windows: <a href="http://railsinstaller.org/en">http://railsinstaller.org/en</a>
<br>Mac: Should come pre installed
<br>Linux: sudo apt-get install ruby
or whatever package manager works on your distro
<br><br>
Then navigate to the containing folder with the command <br>
$ ruby driver.rb

<h3> Requirements </h3>
<ul>
  <li> Items can be candy, soda, snacks etc. <ul><li> If I knew what pattern they would be in I'd consider objectifying them instead I stored them in an array of Strings called items for every Slot object. </li></ul></li>
  <li>Prices are 'by slot'.<ul><li>each slot has attribute called price ex: aSlot.price</li></ul> </li>
  <li>Keeps track of items, where they are stored in a grid based vending machine where each slot has a specific depth. <ul><li>I added a findItem("itemname") method to Vending Machine but ran out of time for it find every possible entry of that item. Instead it returns a hashmap of the first occurence of that item in each slot and what depth they sit at. </li></ul></li>
  <li>Keeps track of $ in the system (ignore coins) <ul><li> Vending machine has a instance variable called cash for this ex: vm.cash </li></ul> </li>
  <li>Keeps track of how much $ user has put in (ignore coins) <ul><li> vm.user_credit</li></ul></li>
  <li>Function where user puts in $. <ul><li>Vending machine has an instance method called insert_credit</li></ul></li>
  <li>Function where user purchases something in a location in format "A1,A2..., B1,B2" <ul><li> Vending Machine has a method selection(coord) where you input a slot name like "A1" or :A2. It accepts both Strings or Symbols </li></ul> </li>
  <li>Checks to see if there is enough $ and stock. <ul><li>In the dispense method It throws errors if there isn't enough cash to return change. Empty slots are handled by the selection method</li></ul></li>
  <li>Dispense <ul><li>Look for the method dispense for VendingMachine</li></ul></li>
  <li>Return change. <ul><li>returned in the dispense method for VendingMachine</li></ul></li>
  <li>Update stock. <ul><li>addItem or sellItem methods for Slot</li></ul></li>
  <li> Function to update stock where someone would add stock to a slot and update internally. <ul><li>add_load method for VendingMachine</li></ul> </li>
</ul>
