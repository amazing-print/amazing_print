# Copyright (c) 2010-2016 Michael Dvorkin and contributors
#
# Awesome Print is freely distributable under the terms of MIT license.
# See LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
#
# AmazingPrint might be loaded implicitly through ~/.irbrc or ~/.pryrc
# so do nothing for subsequent requires.
#
unless defined?(AmazingPrint::Inspector)
  %w[awesome_method_array string method object class kernel].each do |file|
    require "amazing_print/core_ext/#{file}"
  end

  require 'amazing_print/custom_defaults'
  require 'amazing_print/inspector'
  require 'amazing_print/formatter'
  require 'amazing_print/version'
  require 'amazing_print/core_ext/logger' if defined?(Logger)
  #
  # Load the following under normal circumstances as well as in Rails
  # console when required from ~/.irbrc or ~/.pryrc.
  #
  if defined?(ActiveRecord) || AmazingPrint.rails_console?
    require 'amazing_print/ext/active_record'
  end
  if defined?(ActiveSupport) || AmazingPrint.rails_console?
    require 'amazing_print/ext/active_support'
  end
  #
  # Load remaining extensions.
  #
  if defined?(ActiveSupport.on_load)
    ActiveSupport.on_load(:action_view) do
      require 'amazing_print/ext/action_view'
    end
  end
  require 'amazing_print/ext/mongo_mapper'   if defined?(MongoMapper)
  require 'amazing_print/ext/mongoid'        if defined?(Mongoid)
  require 'amazing_print/ext/nokogiri'       if defined?(Nokogiri)
  require 'amazing_print/ext/nobrainer'      if defined?(NoBrainer)
  require 'amazing_print/ext/ripple'         if defined?(Ripple)
  require 'amazing_print/ext/sequel'         if defined?(Sequel)
  require 'amazing_print/ext/ostruct'        if defined?(OpenStruct)
end
# test
