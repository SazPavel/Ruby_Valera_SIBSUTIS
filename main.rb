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
  menu.execute_command(valera)
  after_text = menu.menu_items[menu.current_action].after_text
  puts "\n\nValera: \"#{after_text}\"\n\n\n"
end
