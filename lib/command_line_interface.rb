def welcome
  puts "Welcome to the Star Wars CLI"
  puts "How would you like to search?"
  puts "Option 1 to search by character name (Type 1)"
  puts "Option 2 to search by starship name (Type 2)"
end

def get_user_input
  gets.chomp.to_s
end
