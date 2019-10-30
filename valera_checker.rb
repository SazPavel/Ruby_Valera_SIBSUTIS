# Checker for available actions
class ValeraChecker
  def self.check(valera, action_string)
    action = validate_action(action_string)
    action = nil unless available?(valera, action) && valera.alive?
    action
  end

  def self.validate_action(action_string)
    available_actions = %w[work behold wine bar \
                           marginal sing sleep]
    (available_actions.include? action_string) ? action_string : nil
  end

  def self.available?(valera, action)
    action_available = true
    action_available = false \
        if action == 'work' && (valera.checker?('mana', 50) || valera.checker?('fatigue', 10))
    action_available
  end

  private_class_method :validate_action
  private_class_method :available?
end
