# frozen_string_literal: true

require './valera_loader.rb'

class SystemAction
  attr_accessor :before_text, :after_text, :name

  def initialize(name = '', before_text = '',
                 after_text = '', save_file = 'valera_properties.txt')
    @name = name
    @before_text = before_text
    @after_text = after_text
    @save_file = save_file
  end

  def execute!(valera)
    case @name
    when 'exit'
      nil
    when 'load'
      properties = ValeraLoader.load_from_file(@save_file)
      valera.reinitialize!(properties[0], properties[1], properties[2],
                           properties[3], properties[4])
    when 'save'
      properties = ValeraLoader.save_to_file(valera, @save_file)
    when 'new'
      valera.reinitialize!()
    end
    @name
  end
end
