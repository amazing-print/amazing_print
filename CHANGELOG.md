## unreleased
  - Drop support for Ruby 2.3 and 2.4 as well as JRuby 9.1

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
