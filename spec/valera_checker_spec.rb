require 'rspec'
require './valera_checker.rb'
require './valera.rb'

RSpec.describe ValeraChecker do
  describe '#validate_action' do
    subject { ValeraChecker.send(:validate_action, action) }
    context 'when action name is correct' do
      let(:action) { 'work' }
      it { is_expected.to eq action }
    end
    context 'when action name is incorrect' do
      let(:action) { 'unknown command' }
      it { is_expected.to be nil }
    end
  end
  describe '#available?' do
    subject { ValeraChecker.send(:available?, valera, action) }
    context 'when Valera can do this action' do
      let(:action) { 'work' }
      let(:valera) { Valera.new(100, 10, 0, 0, 0) }
      it { is_expected.to be_truthy }
    end
    context 'when Valera cannot do this action' do
      let(:action) { 'work' }
      let(:valera) { Valera.new(100, 100, 0, 0, 0) }
      it { is_expected.to be_falsey }
    end
  end
  describe '#check' do
    subject { ValeraChecker.check(valera, action) }
    context 'when Valera is alive and action is correct' do
      let(:action) { 'work' }
      let(:valera) { Valera.new(100, 10, 0, 0, 0) }
      it { is_expected.to eq action }
    end
    context 'when Valera is alive and action is incorrect' do
      let(:action) { 'ork' }
      let(:valera) { Valera.new(100, 10, 0, 0, 0) }
      it { is_expected.to be nil }
    end
    context 'when Valera is no more' do
      let(:action) { 'work' }
      let(:valera) { Valera.new(0, 10, 0, 0, 0) }
      it { is_expected.to be nil }
    end
  end
end
