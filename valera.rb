# frozen_string_literal: true

# Valera properties
class Valera
  attr_accessor :health, :mana, :cheerfulness, :fatigue, :money

  def initialize(mana, cheerfulness, fatigue, money)
    @health = 100
    @mana = mana
    @cheerfulness = cheerfulness
    @fatigue = fatigue
    @money = money
  end
  def health!(health)
    @health += health
    @health = 100 if @health > 100
    @health = 0 if @health < 0
    @health
  end
  def mana!(mana)
    @mana += mana
    @mana = 100 if @mana > 100
    @mana = 0 if @mana < 0
    @mana
  end
  def cheerfulness!(cheerfulness)
    @cheerfulness += cheerfulness
    @cheerfulness = 100 if @cheerfulness > 100
    @cheerfulness = 0 if @cheerfulness < 0
    @cheerfulness
  end
  def fatigue!(fatigue)
    @fatigue += fatigue
    @fatigue = 100 if @fatigue > 100
    @fatigue = 0 if @fatigue < 0
    @fatigue
  end
  def money!(money)
    @money += money
    @money = 0 if @money < 0
    @money
  end
  def alive?
    if @health
      true
    else
      false 
    end
  end
end
