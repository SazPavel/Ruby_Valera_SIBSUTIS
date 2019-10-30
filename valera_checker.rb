# TODO: handing w/o object creation (self?)
# TODO: private

# Checker for available actions
class ValeraChecker
  def check(valera, action_string)
    action = validate_action(action_string)
    action = nil unless available?(valera, action) && valera.alive?
    action
  end

  def validate_action(action_string)
    available_actions = %w[work behold wine bar \
                           marginal sing sleep]
    (available_actions.include? action_string) ? action_string : nil
  end

  def available?(valera, action)
    action_available = true
    action_available = false \
        if action == 'work' && (valera.mana >= 50 || valera.fatigue >= 10)
    action_available
  end
end
