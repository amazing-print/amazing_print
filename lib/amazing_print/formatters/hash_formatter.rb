# frozen_string_literal: true

require_relative 'base_formatter'

module AmazingPrint
  module Formatters
    class HashFormatter < BaseFormatter
      attr_reader :hash, :inspector, :options

      def initialize(hash, inspector)
        super()
        @hash = hash
        @inspector = inspector
        @options = inspector.options
      end

      def format
        if hash.empty?
          empty_hash
        elsif multiline_hash?
          multiline_hash
        else
          simple_hash
        end
      end

      private

      def empty_hash
        '{}'
      end

      def multiline_hash?
        options[:multiline]
      end

      def multiline_hash
        ["{\n", printable_hash.join(",\n"), "\n#{outdent}}"].join
      end

      def simple_hash
        "{ #{printable_hash.join(', ')} }"
      end

      def printable_hash
        data = printable_keys
        width = left_width(data)

        data.map! do |key, value|
          indented do
            if options[:ruby19_syntax] && symbol?(key)
              ruby19_syntax(key, value, width)
            else
              pre_ruby19_syntax(key, value, width)
            end
          end
        end

        should_be_limited? ? limited(data, width, is_hash: true) : data
      end

      def left_width(keys)
        result = max_key_width(keys)
        result += indentation if options[:indent].positive?
        result
      end

      def key_size(key)
        return key.inspect.size if symbol?(key)

        if options[:html]
          single_line { inspector.awesome(key) }.size
        else
          plain_single_line { inspector.awesome(key) }.size
        end
      end

      def max_key_width(keys)
        keys.map { |key, _value| key_size(key) }.max || 0
      end

      def printable_keys
        keys = hash.keys

        keys.sort! { |a, b| a.to_s <=> b.to_s } if options[:sort_keys]

        keys.map! do |key|
          single_line do
            [key, hash[key]]
          end
        end
      end

      def symbol?(key)
        key.is_a?(Symbol)
      end

      def ruby19_syntax(key, value, width)
        # Move the colon to the right side of the symbol
        awesome_key = inspector.awesome(key).sub(/#{key.inspect}/, "#{key}:")

        "#{align(awesome_key, width)} #{inspector.awesome(value)}"
      end

      def pre_ruby19_syntax(key, value, width)
        awesome_key = single_line { inspector.awesome(key) }
        "#{align(awesome_key, width)}#{colorize(' => ', :hash)}#{inspector.awesome(value)}"
      end

      def plain_single_line(&block)
        plain = options[:plain]
        options[:plain] = true
        single_line(&block)
      ensure
        options[:plain] = plain
      end

      def single_line
        multiline = options[:multiline]
        options[:multiline] = false
        yield
      ensure
        options[:multiline] = multiline
      end
    end
  end
end
