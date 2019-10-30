# Checker for available actions
#TODO handing w/o object creation

class ValeraChecker

  def validate_action(action_string)
    available_actions = ['work', 'behold', 'wine', 'bar', \
                         'marginal', 'sing', 'sleep']
    (available_actions.include? action_string) ? action_string : nil
  end
  
  def available?(valera, action)
    action_available = true
    action_available = false \
        if action == 'work' && (valera.mana >= 50 || valera.fatigue >= 10)
    action_available
  end
end
