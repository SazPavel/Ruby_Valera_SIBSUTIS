# frozen_string_literal: true

require './valera_checker.rb'
# Stores all actions
class ActionsContainer
  attr_accessor :actions

  def initialize(actions)
    @actions = actions
  end

  def available_action(valera)
    actions.select { |action| ValeraChecker.send(:check, valera, action) }
  end
end
