# frozen_string_literal: true

require './action.rb'
require './valera.rb'

valera = Valera.new(10)
puts valera.checker?('health', 50)
