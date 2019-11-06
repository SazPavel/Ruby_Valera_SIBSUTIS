# frozen_string_literal: true

require './valera.rb'
require './action_loader.rb'
require './menu_io.rb'

valera = Valera.new
actions = ActionLoader.new('action.yaml').load
menu = MenuIO.new(actions)

loop do
  menu.update!(valera)
  menu.print_valera(valera)
  menu.print_menu
  puts 'incorrect value, try again' until menu.correct_input?(gets)
  after_text = menu.execute_command(valera)
  puts "\n\"#{after_text}\"\n\n\n"
  exit if after_text == 'exit'
  puts 'Valera is dead' unless valera.alive?
end
