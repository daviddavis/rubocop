# encoding: utf-8

require 'spec_helper'

module Rubocop
  module Cop
    module Style
      describe FavorJoin do
        subject(:fj) { FavorJoin.new }

        it 'registers an offence for an array followed by string' do
          inspect_source(fj,
                         ['%w(one two three) * ", "'])
          expect(fj.offences.size).to eq(1)
          expect(fj.messages)
            .to eq([FavorJoin::MSG])
        end

        it 'does not register an offence for numbers' do
          inspect_source(fj,
                         ['%w(one two three) * 4'])
          expect(fj.offences).to be_empty
        end

        it 'does not register an offence for ambiguous cases' do
          inspect_source(fj,
                         ['test * ", "'])
          expect(fj.offences).to be_empty

          inspect_source(fj,
                         ['%w(one two three) * test'])
          expect(fj.offences).to be_empty
        end
      end
    end
  end
end
