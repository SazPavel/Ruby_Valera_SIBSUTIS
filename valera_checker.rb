# frozen_string_literal: true

require './action.rb'

# Checker for available actions
class ValeraChecker
  def self.check(valera, action)
    if valid?(action.name)
      action_res = available?(valera, action) && valera.alive? ? action : nil
    end
    action_res
  end

  def self.valid?(action_string)
    # sing1 - if mana < 40, sing2 if mana > 70 sing3 if 40 < mana < 70
    # sleep1 - if mana < 30 sleep2 if mana > 70 sleep3 if 30 < mana < 70
    available_actions = %w[work behold wine bar \
                           marginal sing1 sing2 sing3 sleep1 sleep2 sleep3]
    available_actions.include?(action_string)
  end

  def self.available?(valera, action)
    cond_results = []
    action.conds.each do |cond|
      cond_results.push( \
        (valera.send cond['field']).send(cond['operator'], cond['value'])
      )
    end
    !cond_results.include?(false)
  end

  private_class_method :valid?
  private_class_method :available?
end
