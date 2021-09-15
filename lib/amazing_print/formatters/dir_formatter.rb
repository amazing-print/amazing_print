# frozen_string_literal: true

require 'shellwords'

require_relative 'base_formatter'

module AmazingPrint
  module Formatters
    class DirFormatter < BaseFormatter
      attr_reader :dir, :inspector, :options

      def initialize(dir, inspector)
        super()
        @dir = dir
        @inspector = inspector
        @options = inspector.options
      end

      def format
        ls = `ls -alF #{dir.path.shellescape}`
        colorize(ls.empty? ? dir.inspect : "#{dir.inspect}\n#{ls.chop}", :dir)
      end
    end
  end
end
