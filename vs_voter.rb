#This voter class creates each voter and attributes political views of all people in the USA. These voters are then added in the voter directory in the USA.
class Voter < Person
  attr_accessor :political_view

  def initialize(name, political_view)
    @name = name
    @political_view = political_view
  end
end
