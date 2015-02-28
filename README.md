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
  <li>Prices are 'by slot'. </li>
  <li>Keeps track of items, where they are stored in a grid based vending machine where each slot has a specific depth. </li>
  <li>Keeps track of $ in the system (ignore coins) </li>
  <li>Keeps track of how much $ user has put in (ignore coins) </li>
  <li>Function where user puts in $. </li>
  <li>Function where user purchases something in a location in format "A1,A2..., B1,B2"
  <li>Checks to see if there is enough $ and stock. </li>
  <li>Dispense </li>
  <li>Return change. </li>
  <li>Update stock. </li>
  <li> Function to update stock where someone would add stock to a slot and update internally. </li>
</ul>
