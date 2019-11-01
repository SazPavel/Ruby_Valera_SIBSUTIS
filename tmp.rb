# frozen_string_literal: true

require './action.rb'
require './valera.rb'

valera = Valera.new(100, 100, 0, 0, 0)
action = Action.new(name: 'work', effects: \
      [{ 'field' => 'mana', 'operator' => '-', 'value' => 50 }, \
       { 'field' => 'fatigue', 'operator' => '+', 'value' => 10 }])
puts valera.mana
action.execute!(valera)
puts valera.mana
