require("pry")
require_relative("model/bounty_hunter.rb")

Bounty.delete_all()

bounty_1 = Bounty.new(
  {
    "name" => "Keith",
    "species" => "Scotch",
    "bounty_value" => "100",
    "last_known_location" => "Cowdenbeeth"
  }
)

bounty_2 = Bounty.new(
  {
    "name" => "Jackie",
    "species" => "Northerner",
    "bounty_value" => "150",
    "last_known_location" => "The South"
  }
)

binding.pry
nil

#     Implement save, update and delete methods on your class
#
# Extension
#
#     Implement a find method given an id that returns one instance of your class that matches that id (do you have to use a map method? Hmm.) E.G
#
#    bounty_hunter_1 = BountyHunter.find(1)
#    puts bounty_hunter_1
#
# Should print out the object for the bounty hunter.
