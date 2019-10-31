# frozen_string_literal: true

require 'rspec'
require './valera_checker.rb'
require './valera.rb'
require './action.rb'

RSpec.describe ValeraChecker do
  describe '#valid?' do
    subject { ValeraChecker.send(:valid?, action_string) }
    context 'when action is correct' do
      let(:action_string) { 'work' }
      it { is_expected.to be_truthy }
    end
    context 'when action is not correct' do
      let(:action_string) { 'ork' }
      it { is_expected.to be_falsey }
    end
  end
  describe '#available?' do
    subject { ValeraChecker.send(:available?, valera, action) }
    let(:action) do
      Action.new(name: 'work', conds: \
        [{ 'field' => 'mana', 'operator' => '<', 'value' => 50 }, \
         { 'field' => 'fatigue', 'operator' => '<', 'value' => 10 }])
    end
    context 'when action is available' do
      let(:valera) { Valera.new(100, 0, 0, 0, 0) }
      it { is_expected.to be_truthy }
    end
    context 'when action is not available' do
      let(:valera) { Valera.new(100, 0, 0, 50, 0) }
      it { is_expected.to be_falsey }
    end
  end
end
