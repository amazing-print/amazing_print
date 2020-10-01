# frozen_string_literal: true

unless defined? AwesomePrint
  class AwesomePrint
    def self.defaults=(default_values)
      AmazingPrint.defaults = default_values
    end
  end
end
