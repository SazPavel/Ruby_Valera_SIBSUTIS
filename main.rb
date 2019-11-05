require './valera_loader.rb'
require './valera.rb'
require './action_loader.rb'
require './menu.rb'

properties = ValeraLoader.load_from_file('valera_properties.yaml')
valera = Valera.new(properties[0], properties[1], properties[2],
                    properties[3], properties[4])
action_loader = ActionLoader.new('action.yaml')
actions = action_loader.load
menu = Menu.new(actions)

loop do
  menu.update(valera)
  menu.print_valera(valera)
  menu.print_menu
  puts 'incorrect value, try again' until menu.correct_input?(gets)
  menu.current_action.execute!(valera)
  puts "\n\nValera: \"#{menu.current_action.after_text}\"\n\n\n"
end
