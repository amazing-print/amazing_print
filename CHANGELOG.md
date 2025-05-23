# CHANGELOG

## Unreleased

## v1.8.1

- Fix authors list in gemspec #128
- Use array.length.zero? to avoid issues with ActiveRecord collection proxy #129
- grammar glowup in README.md #130

## v1.8.0

- Drop Ruby 3.0 and add Ruby 3.4 #125

## v1.7.2

- update the version string in `AmazingPrint.version`

## v1.7.1

- no changes, only linting

## v1.7.0

- Require Ruby >= 3.0
- Add support for `::ActiveModel::Attributes`
- Preserve user defined color defaults
- Micro-optimization to `AmazingPrint::ActiveRecord#cast` (avoid calls to `#ancestors`)

## v1.6.0

- Use pager with Pry #96
- Add Rails 7 appraisal #98
- Allow Hash keys to be colorized #99
- Use CI merge queue #104
- Add support for Ruby 3.3 #105
- Add Mongoid field aliases #106
- Add bigdecimal gem #109
- Add ExtLoader to help with require order issues #110

## v1.5.0

- Drop support for Ruby 2.3 and 2.4 as well as JRuby 9.1
- Add File/Dir formatters for mswin platform #48
- Don't monkey patch String class #91
- Fix ruby19 hash syntax so it can be copy-pasted #94

## v1.4.0

- Support loading config from `$XDG_CONFIG_HOME/aprc` - #63
- Remove support for Rails 5.1 #75
- Update AR specs for Ruby 2.6.7 #76
- Load .aprc configs only once. #74
- Add XDG config support #77
- Rubocop updates #79
- Update Irb integration for v1.2.6+ #81

## v1.3.0

- Fix HTML escaping problems #53
- Update test suite for Ruby 2.7.2 and JRuby #61
- Add ActionView spec for html_safe #65
- Add support for Rails 6.1 #68
- Update specs for Ruby 3.0 #69

## v1.2.2

- Support Ruby 3.0 / IRB 1.2.6 - #57
- Fix FrozenError - #51
- Drop support for Ruby 2.3 and 2.4 as well as JRuby 9.1 - #46
- Add passing of `options` to `Logger#ap` - #55

## v1.2.1

- Correctly print active_model_errors for models that don't have tables - #42 by sahglie
- Update AmazingPrint::MongoMapper for frozen strings - #44

## v1.2.0

- Fix frozen string literal issue with ActiveRecord
- Add uncolor String method to remove ANSI color codes - #30 by duffyjp
- Restore original copyright - #33 by amarshall
- Remove method core extension since it is not needed since ruby 1.9 - #37 by grosser
- Remove pale and black string color aliases - #38
- Fix formatting ActionController::Parameters - #29

## v1.1.0

- Print out method keyword arguments
- Fix NoMethodError with Sequel
- Code cleanups

Thanks for the great contributions from:

- andydna
- beanieboi

## v1.0.0

- Initial Release.
