#This class is for all people, voters and politicians, in the USA.  All these people live in the USA and are stored here.
class Person < UnitedStates
  attr_accessor :name

  def initialize(name)
    @name = name
  end
end
