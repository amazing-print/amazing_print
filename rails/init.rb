# Copyright (c) 2010-2016 Michael Dvorkin and contributors
#
# AmazingPrint is freely distributable under the terms of MIT license.
# See LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------
#
# Load amazing_print when installed as Rails 2.3.x plugin.
#
unless defined?(AmazingPrint)
  require File.join(File.dirname(__FILE__), '..', 'init')
end
