# frozen_string_literal: true

# Valera properties
class Valera
  attr_accessor :health, :mana, :cheerfulness, :fatigue, :money

  def initialize(health, mana, cheerfulness, fatigue, money)
    @health = health
    @mana = mana
    @cheerfulness = cheerfulness
    @fatigue = fatigue
    @money = money
  end

  def health!(health)
    @health += health
    @health = 100 if @health > 100
    @health = 0 if @health.negative?
    @health
  end

  def mana!(mana)
    @mana += mana
    @mana = 100 if @mana > 100
    @mana = 0 if @mana.negative?
    @mana
  end

  def cheerfulness!(cheerfulness)
    @cheerfulness += cheerfulness
    @cheerfulness = 100 if @cheerfulness > 100
    @cheerfulness = 0 if @cheerfulness.negative?
    @cheerfulness
  end

  def fatigue!(fatigue)
    @fatigue += fatigue
    @fatigue = 100 if @fatigue > 100
    @fatigue = 0 if @fatigue.negative?
    @fatigue
  end

  def money!(money)
    @money += money
    @money = 0 if @money.negative?
    @money
  end

  def alive?
    if @health.positive?
      true
    else
      false
    end
  end
end
