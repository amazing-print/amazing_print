# frozen_string_literal: true

# Copyright (c) 2010-2016 Michael Dvorkin and contributors
#
# AmazingPrint is freely distributable under the terms of MIT license.
# See LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
#
# AmazingPrint might be loaded implicitly through ~/.irbrc or ~/.pryrc
# so do nothing for subsequent requires.
#

# We attempt to load required libraries before we load an extension to prevent
# Gemfile load order issues.
def load_and_require(extension, required_library)
  require(extension) unless defined?(Object.const_get(required_library))
  require_relative "amazing_print/ext/#{extension}"
rescue LoadError
  # library is not included
end

unless defined?(AmazingPrint::Inspector)
  %w[awesome_method_array object class kernel].each do |file|
    require_relative "amazing_print/core_ext/#{file}"
  end

  require_relative 'amazing_print/custom_defaults'
  require_relative 'amazing_print/inspector'
  require_relative 'amazing_print/formatter'
  require_relative 'amazing_print/version'
  require_relative 'amazing_print/core_ext/logger' if defined?(Logger)
  #
  # Load the following under normal circumstances as well as in Rails
  # console when required from ~/.irbrc or ~/.pryrc.
  #
  if AmazingPrint.rails_console?
    require_relative 'amazing_print/ext/active_record'
    require_relative 'amazing_print/ext/active_support'
  else
    load_and_require 'active_record', 'ActiveRecord'
    load_and_require 'active_support', 'ActiveSupport'
  end
  #
  # Load remaining extensions.
  #
  if defined?(ActiveSupport.on_load)
    ActiveSupport.on_load(:action_view) do
      require_relative 'amazing_print/ext/action_view'
    end
  end
  load_and_require 'mongo_mapper', 'MongoMapper'
  load_and_require 'mongoid', 'Mongoid'
  load_and_require 'nokogiri', 'Nokogiri'
  load_and_require 'nobrainer', 'NoBrainer'
  load_and_require 'ripple', 'Ripple'
  load_and_require 'sequel', 'Sequel'
  load_and_require 'ostruct', 'OpenStruct'
end
# test
