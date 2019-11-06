# frozen_string_literal: true

require 'rspec'
require './action_loader.rb'
require './valera.rb'
require './menu.rb'

RSpec.describe Menu do
  let(:valera_alive) { Valera.new(100, 0, 0, 0, 0) }
  let(:valera_not_alive) { Valera.new(0, 0, 0, 0, 0) }
  let(:actions) { ActionLoader.new('./spec/test_action.yaml').load }

  describe '#update' do
    context 'when valera alive' do
      subject { Menu.new(actions) }
      it do
        subject.update!(valera_alive)
        expect(subject.menu_items['1']).to eq \
          actions.available_action(valera_alive)[0]
      end
      it do
        subject.update!(valera_alive)
        load_menu = SystemAction.new('load', 'load', 'proizoshol load')
        expect(subject.menu_items['l'].name).to eq load_menu.name
      end
      it do
        subject.update!(valera_alive)
        save_menu = SystemAction.new('save', 'save', 'proizoshol save')
        expect(subject.menu_items['s'].name).to eq save_menu.name
      end
      it do
        subject.update!(valera_alive)
        exit_menu = SystemAction.new('exit', 'exit', 'exit')
        expect(subject.menu_items['e'].name).to eq exit_menu.name
      end
    end
    context 'when valera not alive' do
      subject { Menu.new(actions) }
      it do
        subject.update!(valera_not_alive)
        expect(subject.menu_items['1']).to eq \
          actions.available_action(valera_not_alive)[0]
      end
      it do
        subject.update!(valera_not_alive)
        load_menu = SystemAction.new('load', 'load', 'proizoshol load')
        expect(subject.menu_items['l'].name).to eq load_menu.name
      end
      it do
        subject.update!(valera_not_alive)
        new_menu = SystemAction.new('new', 'save', 'proizoshol save')
        expect(subject.menu_items['n'].name).to eq new_menu.name
      end
      it do
        subject.update!(valera_not_alive)
        exit_menu = SystemAction.new('exit', 'exit', 'exit')
        expect(subject.menu_items['e'].name).to eq exit_menu.name
      end
    end
  end
end
