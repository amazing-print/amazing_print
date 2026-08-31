# frozen_string_literal: true

require_relative 'base_formatter'

module AmazingPrint
  module Formatters
    class StructFormatter < BaseFormatter
      attr_reader :struct, :variables, :inspector, :options

      def initialize(struct, inspector)
        super()
        @struct = struct
        @variables = struct.members
        @inspector = inspector
        @options = inspector.options
      end

      def format
        vars = variables.map do |var|
          [var.to_s, var]
        end

        width = max_key_width(vars)
        width += indentation if options[:indent].positive?

        data = (options[:sort_keys] ? vars.sort : vars).map do |declaration, var|
          indented do
            align(declaration, width) + colorize(' = ', :hash) + inspector.awesome(struct.send(var))
          end
        end

        if options[:multiline]
          "#<#{awesome_instance}\n#{data.join(%(,\n))}\n#{outdent}>"
        else
          "#<#{awesome_instance} #{data.join(', ')}>"
        end
      end

      private

      def awesome_instance
        prefix =
          if defined?(Data) && struct.is_a?(Data)
            'data '
          else
            'struct '
          end

        str = prefix + struct.send(options[:class_name]).to_s
        return str unless options[:object_id]

        # We need to ensure that the original Kernel#format is used here instead of the one
        # defined above.
        # rubocop:disable Style/ColonMethodCall
        str + Kernel::format(':0x%08x', struct.__id__ * 2)
        # rubocop:enable Style/ColonMethodCall
      end

      def max_key_width(keys)
        keys.map { |declaration, _| declaration.size }.max || 0
      end
    end
  end
end
