# frozen_string_literal: true

require './valera.rb'

# Save / Load properties
# If input is incorrect, properties will be set to default:
# [100, 0, 0, 0, 0]
class ValeraLoader
  def self.load_from_file(fname)
    filename = File.join(File.dirname(__FILE__), fname)
    properties = if File.file?(filename)
                   File.read(filename).split(' ').map(&:to_i)
                 else
                   [100, 0, 0, 0, 0]
                 end
    properties.length == 5 ? properties : [100, 0, 0, 0, 0]
  end

  def self.save_to_file(valera, fname)
    filename = File.join(File.dirname(__FILE__), fname)
    properties = [valera.health, valera.mana, valera.cheerfulness, \
                  valera.fatigue, valera.money]
    File.write(filename, properties.join(' '))
  end
end
