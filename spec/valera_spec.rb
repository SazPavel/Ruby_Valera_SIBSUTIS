# frozen_string_literal: true

require 'rspec'
require './valera.rb'

RSpec.describe Valera do
  let(:valera) { Valera.new(100, 100, 100, 100) }

  describe '#health!' do
    context 'when decrease' do
      it { expect(valera.health!(-50)).to be 50 }
    end
    context 'when encrease' do
      it { expect(valera.health!(50)).to be 100 }
    end
    context 'when more then 100' do
      it { expect(valera.health!(50)).to be 100 }
    end
    context 'when less then 0' do
      it { expect(valera.health!(-150)).to be 0 }
    end
  end

  describe '#mana!' do
    context 'when decrease' do
      it { expect(valera.mana!(-50)).to be 50 }
    end
    context 'when encrease' do
      it { expect(valera.mana!(50)).to be 100 }
    end
    context 'when more then 100' do
      it { expect(valera.mana!(50)).to be 100 }
    end
    context 'when less then 0' do
      it { expect(valera.mana!(-150)).to be 0 }
    end
  end

  describe '#money!' do
    context 'when decrease' do
      it { expect(valera.mana!(-50)).to be 50 }
    end
    context 'when encrease' do
      it { expect(valera.mana!(50)).to be 100 }
    end
    context 'when less then 0' do
      it { expect(valera.mana!(-150)).to be 0 }
    end
  end

  describe '#alive?' do
    context 'when true' do
      it { expect(valera.alive?).to be true }
    end
    context 'when false' do
      valera.health!(-150)
      it { expect(valera.alive?).to be false }
    end
  end
end
