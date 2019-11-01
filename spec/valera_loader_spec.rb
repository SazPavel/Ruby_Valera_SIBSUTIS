# frozen_string_literal: true

require 'rspec'
require './valera.rb'
require './valera_loader.rb'

RSpec.describe ValeraLoader do
  describe '#load_from_file' do
    subject { ValeraLoader.load_from_file(fname) }
    context 'when input file exists' do
      context 'and input is correct' do
        let(:fname) { './spec/valid_valera.txt' }
        it { is_expected.to eq [50, 50, 50, 50, 50] }
      end
      context 'and input is incorrect' do
        let(:fname) { './spec/invalid_valera.txt' }
        it { is_expected.to eq [100, 0, 0, 0, 0] }
      end
    end
    context 'when input file doesn\'t exist' do
      let(:fname) { 'your_valera_is_in_another_castle' }
      it { is_expected.to eq [100, 0, 0, 0, 0] }
    end
  end
end
