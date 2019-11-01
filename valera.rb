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
    @health = check_borders(value.to_i, 0, 100)
  end

  def mana=(value)
    @mana = check_borders(value.to_i, 0, 100)
  end

  def cheerfulness=(value)
    @cheerfulness = check_borders(value.to_i, -10, 10)
  end

  def fatigue=(value)
    @fatigue = check_borders(value.to_i, 0, 100)
  end

  def money=(value)
    @money = check_borders(value.to_i, 0, Float::INFINITY)
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
    @health = check_borders(@health + health.to_i, 0, 100)
  end

  def mana!(mana)
    @mana = check_borders(@mana + mana.to_i, 0, 100)
  end

  def cheerfulness!(cheerfulness)
    @cheerfulness = check_borders(@cheerfulness + cheerfulness.to_i, -10, 10)
  end

  def fatigue!(fatigue)
    @fatigue = check_borders(@fatigue + fatigue.to_i, 0, 100)
  end

  def money!(money)
    @money = check_borders(@money + money.to_i, 0, Float::INFINITY)
  end

  def check_borders(property, min_border, max_border)
    property = property > min_border ? property : min_border
    property < max_border ? property : max_border
  end
end
