# frozen_string_literal: true

require 'rspec'
require './system_action.rb'
require './valera.rb'

RSpec.describe SystemAction do
  let(:valera) { Valera.new(10, 10, 10, 10, 10) }
  let(:system_action_exit) { SystemAction.new('exit', 'exit', 'exit') }
  let(:system_action_save) do
    SystemAction.new('save', 'save', 'proizoshol save',
                     './spec/save_test_valera.txt')
  end
  let(:system_action_load) do
    SystemAction.new('load', 'load', 'proizoshol load',
                     './spec/save_test_valera.txt')
  end
  let(:system_action_new) do
    SystemAction.new('new', 'new game', 'start new game')
  end

  describe '#execute!' do
    context 'when exit' do
      it { expect(system_action_exit.execute!(valera)).to be 'exit' }
    end
    context 'when save' do
      it { expect(system_action_save.execute!(valera)).to be 'save' }
    end
    context 'when load' do
      subject { Valera.new(0, 0, 0, 0, 0) }
      it { expect(system_action_load.execute!(subject)).to be 'load' }
      it do
        system_action_load.execute!(subject)
        expect(subject.health).to be 10
        expect(subject.mana).to be 10
        expect(subject.cheerfulness).to be 10
        expect(subject.fatigue).to be 10
        expect(subject.money).to be 10
      end
    end
    context 'when new game' do
      subject { Valera.new(0, 0, 0, 0, 0) }
      it { expect(system_action_new.execute!(subject)).to be 'new' }
      it do
        system_action_new.execute!(subject)
        expect(subject.health).to be 100
        expect(subject.mana).to be 0
        expect(subject.cheerfulness).to be 0
        expect(subject.fatigue).to be 0
        expect(subject.money).to be 100
      end
    end
  end
end
