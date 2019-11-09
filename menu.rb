# frozen_string_literal: true

require './system_action.rb'

# user interface constructor
class Menu
  attr_reader :menu_items, :current_action
  def initialize(actions)
    @actions = actions
    @menu_items = {}
    @current_action = nil
  end

  def update!(valera)
    @menu_items = {}
    action_list = @actions.available_action(valera)
    action_list.each_with_index do |action, index|
      @menu_items[(index + 1).to_s] = action
    end
    @menu_items['l'] = SystemAction.new('load', 'load', 'loaded')
    if valera.alive?
      @menu_items['s'] = SystemAction.new('save', 'save', 'saved')
    else
      @menu_items['n'] = SystemAction.new('new', 'new game', 'start new game')
    end
    @menu_items['e'] = SystemAction.new('exit', 'exit', 'exit')
  end

  def execute_command(valera)
    @menu_items[@current_action].execute!(valera)
    @menu_items[@current_action].after_text
  end
end
