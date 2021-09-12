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
  s.required_ruby_version = '>= 2.5.0'
  s.authors     = ['Michael Dvorkin', 'Kevin McCormack' 'Patrik Wenger']
  s.email       = 'harlemsquirrel@gmail.com'
  s.homepage    = 'https://github.com/amazing-print/amazing_print'
  s.summary     = 'Pretty print Ruby objects with proper indentation and colors'
  s.description = 'Great Ruby debugging companion: pretty print Ruby objects to visualize their structure. Supports custom object formatting via plugins'
  s.license     = 'MIT'

  s.files         = Dir['[A-Z]*[^~]'] + Dir['lib/**/*.rb'] + Dir['spec/**/*'] + ['.gitignore']
  s.test_files    = Dir['spec/**/*']
  s.executables   = []
  s.require_paths = ['lib']

  s.add_development_dependency 'appraisal', '~> 2.3'
  s.add_development_dependency 'fakefs', '~> 1.2'
  s.add_development_dependency 'nokogiri', '~> 1.10'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec', '~> 3.9'
  s.add_development_dependency 'rubocop', '~> 1.20'
  s.add_development_dependency 'rubocop-rspec', '~> 2.4'
end
