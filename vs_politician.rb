#The politician class creates politicians and attributes their party affiliation.  These politicians are then added to the politician directory in the USA.
class Politician < Voter
  attr_accessor :party_affiliation

  def initialize(name, party_affiliation)
    @name = name
    @party_affiliation = party_affiliation
  end
end
