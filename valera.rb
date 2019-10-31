# frozen_string_literal: true

# Valera properties
class Valera
  attr_reader :health, :mana, :cheerfulness, :fatigue, :money

  def initialize(health, mana, cheerfulness, fatigue, money)
    @health = health
    @mana = mana
    @cheerfulness = cheerfulness
    @fatigue = fatigue
    @money = money
  end

  def health=(value)
    @health = value
    @health = valid_min_border(@health, 0)
    @health = valid_max_border(@health, 100)
  end

  def mana=(value)
    @mana = value
    @mana = valid_min_border(@mana, 0)
    @mana = valid_max_border(@mana, 100)
  end

  def cheerfulness=(value)
    @cheerfulness = value
    @cheerfulness = valid_min_border(@cheerfulness, -10)
    @cheerfulness = valid_max_border(@cheerfulness, 10)
  end

  def fatigue=(value)
    @fatigue = value
    @fatigue = valid_min_border(@fatigue, 0)
    @fatigue = valid_max_border(@fatigue, 100)
  end

  def money=(value)
    @money = value
    @money = valid_min_border(@money, 0)
  end

  def checker?(propertie, value)
    case propertie
    when 'health' then @health >= value
    when 'mana' then @mana >= value
    when 'cheerfulness' then @cheerfulness >= value
    when 'fatigue' then @fatigue >= value
    when 'money' then @money >= value
    end
  end

  def change_properties!(propertie, value)
    case propertie
    when 'health' then health!(value)
    when 'mana' then mana!(value)
    when 'cheerfulness' then cheerfulness!(value)
    when 'fatigue' then fatigue!(value)
    when 'money' then money!(value)
    end
  end

  def alive?
    @health.positive?
  end

  private

  def health!(health)
    @health += health
    @health = valid_min_border(@health, 0)
    @health = valid_max_border(@health, 100)
  end

  def mana!(mana)
    @mana += mana
    @mana = valid_min_border(@mana, 0)
    @mana = valid_max_border(@mana, 100)
  end

  def cheerfulness!(cheerfulness)
    @cheerfulness += cheerfulness
    @cheerfulness = valid_min_border(@cheerfulness, -10)
    @cheerfulness = valid_max_border(@cheerfulness, 10)
  end

  def fatigue!(fatigue)
    @fatigue += fatigue
    @fatigue = valid_min_border(@fatigue, 0)
    @fatigue = valid_max_border(@fatigue, 100)
  end

  def money!(money)
    @money += money
    @money = valid_min_border(@money, 0)
  end

  def valid_min_border(propertie, min_border)
    propertie > min_border ? propertie : min_border
  end

  def valid_max_border(propertie, max_border)
    propertie < max_border ? propertie : max_border
  end
end
