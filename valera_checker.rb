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
    available_actions = %w[work behold wine bar \
                           marginal sing sleep]
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
