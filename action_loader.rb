# frozen_string_literal: true

require 'yaml'
require './actions_container.rb'
# Load all action from file
class ActionLoader
  def initialize(filename)
    @filename = filename
  end

  def load
    return unless File.file?(@filename)

    ActionsContainer.new(
      YAML.safe_load(File.open(@filename)).map { |data| build_action(data) }
    )
  end

  private

  def build_action(data)
    Action.new name: data['name'],
               after_text: data['after_text'],
               before_text: data['before_text'],
               conds: data['conds'].map { |cond| build_cond(cond) },
               effects: data['effects'].map { |effect| build_effect(effect) }
  end

  def build_cond(data)
    data.to_hash
  end

  def build_effect(data)
    data.to_hash
  end
end
