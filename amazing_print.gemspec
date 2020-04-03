# Copyright (c) 2020 AmazingPrint and contributors
# Copyright (c) 2010-2016 Michael Dvorkin and contributors
#
# AmazingPrint is freely distributable under the terms of MIT license.
# See LICENSE file or http://www.opensource.org/licenses/mit-license.php
#------------------------------------------------------------------------------

$:.push File.expand_path('lib', __dir__)
require 'amazing_print/version'

Gem::Specification.new do |s|
  s.name        = 'amazing_print'
  s.version     = AmazingPrint.version
  s.authors     = ['Michael Dvorkin', 'Kevin McCormack' 'Patrik Wenger']
  s.date        = Time.now.strftime('%Y-%m-%d')
  s.email       = 'harlemsquirrel@gmail.com'
  s.homepage    = 'https://github.com/amazing-print/amazing_print'
  s.summary     = 'Pretty print Ruby objects with proper indentation and colors'
  s.description = 'Great Ruby debugging companion: pretty print Ruby objects to visualize their structure. Supports custom object formatting via plugins'
  s.license     = 'MIT'

  s.files         = Dir['[A-Z]*[^~]'] + Dir['lib/**/*.rb'] + Dir['spec/**/*'] + ['.gitignore']
  s.test_files    = Dir['spec/**/*']
  s.executables   = []
  s.require_paths = ['lib']

  s.add_development_dependency 'appraisal'
  s.add_development_dependency 'fakefs', '>= 0.2.1'
  s.add_development_dependency 'nokogiri', '>= 1.6.5'
  s.add_development_dependency 'pry'
  s.add_development_dependency 'rspec', '>= 3.0.0'
end
