# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    module Style
      describe EvenOdd do
        subject(:cop) { described_class.new }

        it 'registers an offence for x % 2 == 0' do
          inspect_source(cop,
                         ['x % 2 == 0'])
          expect(cop.offences.size).to eq(1)
          expect(cop.messages).to eq([EvenOdd::MSG_EVEN])
        end

        it 'registers an offence for (x % 2) == 0' do
          inspect_source(cop,
                         ['(x % 2) == 0'])
          expect(cop.offences.size).to eq(1)
          expect(cop.messages).to eq([EvenOdd::MSG_EVEN])
        end

        it 'registers an offence for x % 2 == 1' do
          inspect_source(cop,
                         ['x % 2 == 1'])
          expect(cop.offences.size).to eq(1)
          expect(cop.messages).to eq([EvenOdd::MSG_ODD])
        end

        it 'registers an offence for (x % 2) == 1' do
          inspect_source(cop,
                         ['(x % 2) == 1'])
          expect(cop.offences.size).to eq(1)
          expect(cop.messages).to eq([EvenOdd::MSG_ODD])
        end

        it 'accepts x % 3 == 0' do
          inspect_source(cop,
                         ['x % 3 == 0'])
          expect(cop.offences).to be_empty
        end
      end
    end
  end
end
