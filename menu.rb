require './system_action.rb'

# user interface

class Menu
  attr_accessor :current_action, :menu_items
  def initialize(actions)
    @actions = actions
    @menu_items = {}
    @current_action = nil
  end

  def update(valera)
    @menu_items = {}
    action_list = @actions.available_action(valera)
    action_list.each_with_index { |action, index| @menu_items[(index + 1).to_s] = action }
    @menu_items['l'] = SystemAction.new('load', 'load', 'proizoshol load')
    @menu_items['s'] = SystemAction.new('save', 'save', 'proizoshol save')
    @menu_items['e'] = SystemAction.new('exit', 'exit', 'exit')
  end

  def print_valera(valera)
    puts "health:       #{valera.health}"
    puts "mana:         #{valera.mana}"
    puts "fatigue:      #{valera.fatigue}"
    puts "cheerfulness: #{valera.cheerfulness}"
    puts "money:        #{valera.money}"
  end

  def print_menu
    puts "\nValera\'s next action:"
    @menu_items.each do |key, value|
      puts(key + ') ' + value.before_text)
    end
  end

  def correct_input?(user_input)
    item = user_input.chomp
    flag = @menu_items.key? item
    @current_action = item if flag
    flag
  end

  def execute_command(valera)
    @menu_items[@current_action].execute!(valera)
    @menu_items[@current_action].after_text
  end
end
