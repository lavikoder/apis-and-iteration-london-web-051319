#!/usr/bin/env ruby

require_relative "../lib/api_communicator.rb"
require_relative "../lib/command_line_interface.rb"

welcome
option = get_user_input

if option == '1'
  puts "Enter character name"
  character = get_user_input
  show_character_movies(character)
elsif option == '2'
  puts "Enter starship name"
  starship = get_user_input
  show_starship_specs(starship)
else
  puts "Type 1 or 2"
  option = get_user_input
end
