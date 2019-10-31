# frozen_string_literal: true

require 'rspec'
require './valera.rb'
require './action.rb'
require './actions_container.rb'

RSpec.describe ActionsContainer do
  let(:available_action) do
    Action.new(name: 'behold')
  end
  let(:unknown_action) do
    Action.new(name: 'pork')
  end
  let(:not_available_action) do
    Action.new(name: 'work')
  end
  let(:valera) { Valera.new(100, 20, 0, 100, 0) }
  let(:container) { ActionsContainer.new [unknown_action, available_action, not_available_action] }

  describe '#available_action' do
    subject { container.available_action(valera) }
    context 'when action unknown' do
      it { is_expected.not_to include unknown_action }
    end
    context 'when action available' do
      it { is_expected.to include available_action }
    end
    context 'when action not available' do
      it { is_expected.not_to include not_available_action }
    end
  end
end
