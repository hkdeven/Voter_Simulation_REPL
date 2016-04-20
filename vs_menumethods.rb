#These are all methods used in voter_simulation.rb

#This method compares the users response to the list of valid responses and outputs an error and main menu return if not valid. LOVE THIS!!!
  def verified_answer(user_response, list_of_responses)
    if list_of_responses.include? user_response
       user_response
    else
       invalid_return_mm
    end
  end

# This method stores whole words for politicians political affiliation.
  def whole_affil (new_party_affiliation)
    if new_party_affiliation == "d"
      "Democrat"
    else new_party_affiliation == "r"
      "Republican"
    end
  end

#This method stores whole words for voters political view.
  def whole_views(new_political_view)
    case new_political_view
    when "l"
      "Liberal"
    when "c"
      "Conservative"
    when "t"
      "Tea Party"
    when "s"
      "Socialist"
    when "n"
      "Neutral"
    else
      "Liberal"
    end
  end

  def line_break_50
    american_line = ((("=".blue)+("=".red))*40) + ("=".blue)
    puts american_line
  end

  def security_check
    puts
    slow_r_down "RETINAL AND BIOMETRIC SCAN CONFIRMED.".center(80)
    slow_r_down "WELCOME MADAME INSPECTOR GENERAL LYNN McFARLAND.".center(80).blue
    puts
    puts
  end

# This slows down the text, all spy like.  ;)
  def slow_r_down(text)
    text.to_s.each_char do |x|
      print x
      case x
      when ".", "!", "?"
        sleep(0.35)
      else
        sleep(0.03)
      end
    end
  end

  #If user selects an invalid option it takes them back to main menu.
  def invalid_return_mm
    puts "Invalid option : No match found.  Returning to the main menu.".center(80)
    main_menu
  end

  def menu_header
    line_break_50
    puts "FEDERAL ELECTION COMMISSION: MAIN MENU".center(80)
    line_break_50
  end

  def main_menu
    puts """
    Enter C to create a new voter/politician,
    L to list current voter/politician,
    U to update an existing voter/politician,
    or D to delete.
    """.center(80)
    menu_selection = verified_answer(gets.chomp.downcase, ["c", "l", "u", "d"])
    case menu_selection
    when "c"
      create_option
    when "l"
      list_option
    when "u"
      update_option
    else "d"
      delete_option
    end
    menu_header
    main_menu
  end

#The following methods update a voter or politician in the directory.
def update_option
   puts "Would you like to Update a (V)oter or (P)olitician record?".center(80)
   update_type = verified_answer(gets.chomp.downcase, ["p", "v"])
     if update_type == "p"
       update_politician
       list_politicians
     else
       update_voter
       list_voters
     end
  puts "Record successfully updated.".center(80).green
  puts
end

def name_check_p(passed_name)
  @politician_directory.find_index {|q| q.name == passed_name}
end

def name_check_v(passed_name)
  @voter_directory.find_index {|q| q.name == passed_name}
end

def update_politician
  list_politicians
  puts
  puts "Name of politician you are updating:".center(80)
  name = gets.chomp.downcase
  enum = name_check_p(name)
  if enum == nil
    invalid_return_mm
  else
    initiate_update_p(enum)
  end
end

def update_voter
  list_voters
  puts
  puts "Name of voter you are updating:".center(80)
  name = gets.chomp.downcase
  enum = name_check_v(name)
  if enum == nil
    invalid_return_mm
  else
    initiate_update_v(enum)
  end
end

def initiate_update_p(enum)
  puts "Enter correct name:".center(80)
  @politician_directory[enum].name = gets.chomp.downcase
  puts "Enter correct party affiliation:".center(80)
  puts "(R)epublican or (D)emocrat?".center(80)
  new_party_affiliation = verified_answer(gets.chomp.downcase, ["d", "r"])
  updated_full_affil = whole_affil (new_party_affiliation)
  @politician_directory[enum].party_affiliation = updated_full_affil.downcase
end

def initiate_update_v(enum)
  puts "Enter correct name:".center(80)
  @voter_directory[enum].name = gets.chomp.downcase
  puts "Enter correct political view:".center(80)
  puts """
  POLITICAL VIEW:
  (L)iberal, (C)onservative, (T)ea Party,
  (S)ocialist, or (N)eutral.""".center(80)
  new_political_v = verified_answer(gets.chomp.downcase, ["l", "c", "t", "s", "n"])
  updated_political_v = whole_views (new_political_v)
  @voter_directory[enum].political_view = updated_political_v.downcase
end

# These methods create a new voter or politician.
  def create_option
    puts "Create new (P)olitician or (V)oter?".center(80)
    creation_type = verified_answer(gets.chomp.downcase, ["p", "v"])
    if creation_type.downcase == "p"
      puts "Enter new politician details.".center(80)
      puts "NAME:".center(80)
      new_name = gets.chomp.downcase
      puts "PARTY AFFILIATION: (R)epublican or (D)emocrat?".center(80)
      new_party_affiliation = verified_answer(gets.chomp.downcase, ["d", "r"])
      @politician_directory << Politician.new(new_name, whole_affil(new_party_affiliation))
      list_politicians
    else
      puts "Enter new voter details.".center(80)
      puts "NAME:".center(80)
      new_name = gets.chomp.downcase
      puts """
      POLITICAL VIEW:
      (L)iberal, (C)onservative, (T)ea Party,
      (S)ocialist, or (N)eutral.""".center(80)
      new_political_view = verified_answer(gets.chomp.downcase, ["l", "c", "t", "s", "n"])
      @voter_directory << Voter.new(new_name, whole_views(new_political_view))
      list_voters
    end
    puts "New record created.".center(80).green
    puts
  end

# These methods list records in the directory.
  def list_option
    list_politicians
    list_voters
    puts
    puts "(R)eturn to the main menu?".center(80).green
    menu_return = gets
  end

  def clean_r_up(proper_noun)
    proper_noun.gsub(/[^a-z ]/i, '').split.map(&:capitalize).join(' ')
  end

  def list_politicians
    puts "POLITICIANS:".center(80).blue
    @politician_directory.each do |x|
      puts "#{clean_r_up(x.name)}, #{clean_r_up(x.party_affiliation)}".center(80)
    end
  end

  def list_voters
    puts "VOTERS:".center(80).light_blue
    @voter_directory.each do |y|
      puts "#{clean_r_up(y.name)}, #{clean_r_up(y.political_view)}".center(80)
    end
  end

# These methods delete records from the directory.
  def delete_option
    puts "PROCEED WITH CAUTION".center(80).red
    puts "Delete (P)olitician or (V)oter record?".center(80)
    delete_type = verified_answer(gets.chomp.downcase, ["p", "v"])
       if delete_type == "p"
         delete_politician
         list_politicians
       else
         delete_voter
         list_voters
       end
    puts
  end

  def delete_politician
    list_politicians
    puts
    puts "To delete POLITICIAN record, enter NAME as it appears above:".center(80)
    deletion_named = gets.chomp.downcase
    nam = name_check_p(deletion_named)
    puts "Delete politician record for #{clean_r_up(deletion_named)}?".center(80).red
    puts "Enter (Y)es or (N)o.".center(80).red
    confirm_deletion_named = gets.chomp.downcase
      if confirm_deletion_named.include? "y"
        @politician_directory.delete_if {|x| clean_r_up(x.name) == clean_r_up(deletion_named)}
        puts "Politician record for #{clean_r_up(deletion_named)} DELETED.".center(80).green
      elsif confirm_deletion_named.include? "n"
        puts "Deletion action aborted.  Returning to main menu.".center(80)
        puts
      else
        invalid_return_mm
    end
  end

  def delete_voter
    list_voters
    puts
    puts "To delete VOTER record, enter NAME as it appears above:".center(80)
    deletion_named = gets.chomp.downcase
    nam = name_check_v(deletion_named)
    puts "Delete voter record for #{clean_r_up(deletion_named)}?".center(80).red
    puts "Enter (Y)es or (N)o.".center(80).red
    confirm_deletion_named = gets.chomp.downcase
      if confirm_deletion_named.include? "y"
        @voter_directory.delete_if {|x| clean_r_up(x.name) == clean_r_up(deletion_named)}
        puts "Voter record for #{clean_r_up(deletion_named)} DELETED.".center(80).green
      elsif confirm_deletion_named.include? "n"
        puts "Deletion action aborted.  Returning to main menu.".center(80)
        puts
      else
        invalid_return_mm
    end
  end
