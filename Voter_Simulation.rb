=begin
Welcome to the 2016 United States presidential election.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
This REPL-driven simulation is created in Ruby to demonstrate object-oriented programming (OOP) using CRUD actions to navigate through the menu options.

User can build directory of politicians and voters. Users will be able to Create, List, Update and Delete both voters and politicians from the directory.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
=end

#This is the 'world' of the voters, the UnitedStates.
# class UnitedStates
# attr_accessor :country, :city, :district
# end

#This class is for all people, voters and politicians, in the USA.  All these people live in the USA and are stored here.
class People
  attr_accessor :name
  @@voter_directory = []
  @@politician_directory = []

  def initialize(name)
    @name = name
  end

  def self.voter_directory
    @@voter_directory
  end

  def politician_directory
    @@politician_directory
  end

  def delete_record(name)
    (@@politician_directory + @@voter_directory).include? name
#delete
  end

  def update_record
    @@politician_directory.replace
  end
end

#This voter class creates each voter and attributes political views of all people in the USA. These voters are then added in the voter directory in the USA.
class Voters < People
  attr_accessor :political_view

  def initialize(name, political_view)
    super(name)
    @political_view = political_view
    @@voter_directory << self
  end
end

#The politician class creates politicians and attributes their party affiliation.  These politicians are then added to the politician directory in the USA.
class Politicians < Voters
  attr_accessor :party_affiliation

  def initialize(name, party_affiliation)
    super(name)
    @party_affiliation = party_affiliation
    @@politician_directory << self
  end
end

#This step confirms identity of user.
def security_check
  puts
  puts "RETINAL AND BIOMETRIC SCAN CONFIRMED.".center(80)
  sleep(0.5)
  puts "WELCOME MADAME INSPECTOR GENERAL LYNN McFARLAND.".center(80)
  sleep(1.5)
  puts
end
# require "tco"
# require "rmagick"
#
# Magick::Image.read("FEC_logo.png")[0].each_pixel do |pixel, col, row|
#   c = [pixel.red, pixel.green, pixel.blue].map { |v| 255*(v/65535.0) }
#   print "  ".bg c
#   puts if col >= 53
#   end

def line_break_50
  puts ("="*50).center(80)
end

#This is the intro and main menu interface.
def show_intro
  line_break_50
  puts "FEDERAL ELECTION COMMISSION: MAIN MENU".center(80)
  sleep(0.5)
  line_break_50
end

def main_menu
  puts """
  Enter C to create a new voter/politician,
  L to list current voter/politician,
  U to update an existing voter/politician,
  or D to delete.
  """.center(80)
  user_main_menu_selection = gets.chomp.downcase
  until ["c", "l", "u", "d"].include? user_main_menu_selection
  puts """
  I'm sorry, that is not a valid option.
  Enter C to create a new voter/politician,
  L to list current voter/politician,
  U to update an existing voter/politician,
  or D to delete.""".center(80)
  user_main_menu_selection = gets.chomp.downcase
  end
  if user_main_menu_selection.eql? "c"
    create_option
  elsif user_main_menu_selection.eql? "l"
    list_option
  elsif user_main_menu_selection.eql? "u"
    update_option
  else user_main_menu_selection.eql? "d"
    delete_option
  end
end

# ===============================================
# VOTER SIMULATION
# ===============================================

# Intro
security_check
show_intro
main_menu

# Main Menu: Options
# ===============================================

# Create (C)
create_option
# List (L)
list_option
# Update (U)
update_option
# Delete (D)
delete_option
# Completed > Return to Main Menu
# ===============================================
