# encoding: utf-8

module Rubocop
  module Cop
    module Lint
      # This cop checks for calls to debugger or pry
      class Debugger < Cop
        MSG = 'Remove calls to debugger.'

        def on_send(node)
          receiver, method_name, = *node

          if method_name == :debugger && receiver.nil?
            warning(node, :selector)
          elsif method_name =~ /pry/ && receiver &&
                receiver.loc.expression.source == 'binding'
            warning(node, :selector)
          end
        end
      end
    end
  end
end
