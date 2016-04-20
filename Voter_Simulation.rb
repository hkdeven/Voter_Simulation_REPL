=begin
Welcome to the 2016 United States presidential election.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
This REPL-driven simulation is created in Ruby to demonstrate object-oriented programming (OOP) using CRUD menu actions. User can build directory, list, delete, and update politicians and voters.
=end

#This is the 'world' class, UnitedStates.
class UnitedStates
  @voter_directory = []
  @politician_directory = []

require "./vs_menumethods.rb"
require "./vs_person.rb"
require "./vs_voter.rb"
require "./vs_politician.rb"
require "colorize"

# ===============================================
# VOTER SIMULATION
# ===============================================

# Intro
security_check
# Main Menu
menu_header
main_menu

end
