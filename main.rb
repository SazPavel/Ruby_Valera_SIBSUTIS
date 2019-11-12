# frozen_string_literal: true

require './valera.rb'
require './action_loader.rb'
require './menu_io.rb'

valera = Valera.new
actions = ActionLoader.new('action.yaml').load
menu = MenuIO.new(actions)

red_text = "\x1B[31m"
nrm_text = "\x1B[0m"
t_border = "\t" + '-' * 8
requiem =  t_border + red_text + "\n\tYOU DIED\n" + nrm_text + t_border

loop do
  menu.update!(valera)
  menu.print_valera(valera)
  menu.print_menu
  puts 'incorrect value, try again' until menu.correct_input?(gets)
  after_text = menu.execute_command(valera)
  puts "\n\"#{after_text}\"\n\n\n"
  exit if after_text == 'exit'
  puts requiem unless valera.alive?
end
