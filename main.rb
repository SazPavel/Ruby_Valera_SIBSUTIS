require './valera.rb'
require './action_loader.rb'
require './menu.rb'

valera = Valera.new()
action_loader = ActionLoader.new('action.yaml')
actions = action_loader.load
menu = Menu.new(actions)

loop do
  menu.update(valera)
  menu.print_valera(valera)
  menu.print_menu
  puts 'incorrect value, try again' until menu.correct_input?(gets)
  after_text = menu.execute_command(valera)
  puts "\n\"#{after_text}\"\n\n\n"
  exit if after_text == 'exit'
end
