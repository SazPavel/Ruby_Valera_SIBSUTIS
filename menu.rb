# user interface
class Menu
  attr_accessor :current_action
  def initialize(actions)
    @actions = actions
    @menu_items = {}
    @current_action = nil
  end

  def update(valera)
    @menu_items = {}
    action_list = @actions.available_action(valera)
    action_list.each_with_index{|action, index| @menu_items[index] = action}
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
    @menu_items.each{|key, value| 
    puts (key + 1).to_s + ') ' + value.before_text}
  end
  
  def correct_input?(user_input)
    begin
      item = Float(user_input).to_i - 1
      if @menu_items.has_key? item
        @current_action = @menu_items[item]
        flag = true
      else
        flag = false
      end    
    rescue TypeError, ArgumentError
      @current_action = nil
      flag = false
    end 
    flag
  end
end
