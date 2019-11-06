# frozen_string_literal: true

require './menu.rb'

# user interface input/output
class MenuIO < Menu
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
    if @menu_items.key? item
      @current_action = item
      true
    else
      false
    end
  end
end
