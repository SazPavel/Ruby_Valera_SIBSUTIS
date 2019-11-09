# frozen_string_literal: true

require 'rspec'
require './action_loader.rb'
require './valera.rb'
require './menu_io.rb'

RSpec.describe MenuIO do
  let(:valera) { Valera.new(100, 0, 0, 0, 0) }
  let(:actions) { ActionLoader.new('./spec/test_action.yaml').load }

  describe '#correct_input?' do
    subject { MenuIO.new(actions) }
    before(:each) do
      subject.update!(valera)
    end
    context 'when input is correct' do
      context 'when choose action' do
        it { expect(subject.correct_input?('1')).to be_truthy }
      end
      context 'when load' do
        it { expect(subject.correct_input?('l')).to be_truthy }
      end
      context 'when save' do
        it { expect(subject.correct_input?('s')).to be_truthy }
      end
      context 'when exit' do
        it { expect(subject.correct_input?('e')).to be_truthy }
      end
    end
    context 'when input is incorrect' do
      it { expect(subject.correct_input?('huy nya')).to be_falsey }
    end
  end
end
