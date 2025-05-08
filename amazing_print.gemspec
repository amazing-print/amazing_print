# frozen_string_literal: true

# Copyright (c) 2020 AmazingPrint and contributors
# Copyright (c) 2010-2016 Michael Dvorkin and contributors
#
# AmazingPrint is freely distributable under the terms of MIT license.
# See LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------

$LOAD_PATH.push File.expand_path('lib', __dir__)
require 'amazing_print/version'

Gem::Specification.new do |s|
  s.name        = 'amazing_print'
  s.version     = AmazingPrint.version
  s.required_ruby_version = '>= 3.1.0'
  s.authors     = ['Michael Dvorkin', 'Kevin McCormack' 'Patrik Wenger']
  s.email       = 'harlemsquirrel@gmail.com'
  s.homepage    = 'https://github.com/amazing-print/amazing_print'
  s.summary     = 'Pretty print Ruby objects with proper indentation and colors'
  s.description = 'Great Ruby debugging companion: pretty print Ruby objects to visualize their structure. Supports custom object formatting via plugins'
  s.license     = 'MIT'
  s.metadata = {
    'changelog_uri' => 'https://github.com/amazing-print/amazing_print/blob/master/CHANGELOG.md'
  }

  s.files = Dir['lib/**/*', 'rails/*', 'CHANGELOG.md', 'CONTRIBUTING.md', 'README.md']
  s.executables   = []
  s.require_paths = ['lib']
end
