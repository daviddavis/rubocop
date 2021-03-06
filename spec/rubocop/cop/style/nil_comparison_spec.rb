# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    module Style
      describe NilComparison do
        subject(:cop) { described_class.new }

        it 'registers an offence for == nil' do
          inspect_source(cop,
                         ['x == nil'])
          expect(cop.offences.size).to eq(1)
        end

        it 'registers an offence for === nil' do
          inspect_source(cop,
                         ['x === nil'])
          expect(cop.offences.size).to eq(1)
        end

        it 'registers an offence for === nil' do
          inspect_source(cop,
                         ['x != nil'])
          expect(cop.offences.size).to eq(1)
        end

        it 'works with lambda.()' do
          inspect_source(cop, ['a.(x) == nil'])
          expect(cop.offences.size).to eq(1)
        end
      end
    end
  end
end
