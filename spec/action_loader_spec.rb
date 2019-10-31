# frozen_string_literal: true

require 'rspec'
require './actions_container.rb'
require './action_loader.rb'

# TODO: make tests less insane
RSpec.describe ActionLoader do
  describe '#load' do
    subject { ActionLoader.new(filename).load }
    context 'when file exists' do
      let(:filename) { './spec/test_action.yaml' }
      it { expect(subject.actions[0].name).to eq 'work' }
      it { expect(subject.actions[0].before_text).to eq 'Go to work' }
      it { expect(subject.actions[0].after_text).to eq 'STUPID TEXT FOR STUPID RUBY' }
      it { expect(subject.actions[0].conds[0]).to eq'field' => 'mana', 'operator' => '<', 'value' => 50 }
      it { expect(subject.actions[0].conds[1]).to eq 'field' => 'fatigue', 'operator' => '<', 'value' => 10 }
      it { expect(subject.actions[0].effects[0]).to eq 'field' => 'cheerfulness', 'operator' => '-', 'value' => 5 }
      it { expect(subject.actions[0].effects[1]).to eq 'field' => 'mana', 'operator' => '-', 'value' => 30 }
      it { expect(subject.actions[0].effects[2]).to eq 'field' => 'money', 'operator' => '+', 'value' => 150 }
      it { expect(subject.actions[0].effects[3]).to eq 'field' => 'fatigue', 'operator' => '+', 'value' => 70 }
    end
    context 'when file doesn\'t exist' do
      let(:filename) { 'no_action.yaml' }
      it { is_expected.to be nil }
    end
  end
end
