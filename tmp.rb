# frozen_string_literal: true

require './action.rb'
require './valera.rb'

valera = Valera.new(10)
a = '2'

puts((1..10).map(&:to_s).include?(a))
