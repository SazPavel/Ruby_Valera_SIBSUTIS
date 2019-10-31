# frozen_string_literal: true

# TODO

# Stored all informations about action
class Action
  attr_accessor :name, :conds, :effects, :before_text, :after_text
  def initialize(name: '', after_text: '', before_text: '', conds: [], effects: [])
    @name = name
    @before_text = before_text
    @after_text = after_text
    @conds = conds
    @effects = effects
  end
end
