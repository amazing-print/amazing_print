# frozen_string_literal: true

module RailsVersions
  def rails_version
    Gem::Version.new(Rails::VERSION::STRING)
  end

  def rails_main?
    Rails.version.end_with?('.alpha')
  end
  alias activerecord_main? rails_main?

  def rails_8_1?
    Gem::Requirement.new('~> 8.1.0').satisfied_by?(rails_version)
  end
  alias activerecord_8_1? rails_8_1?

  def rails_8_0?
    Gem::Requirement.new('~> 8.0.0').satisfied_by?(rails_version)
  end
  alias activerecord_8_0? rails_8_0?

  def rails_7_2?
    Gem::Requirement.new('~> 7.2.0').satisfied_by?(rails_version)
  end
  alias activerecord_7_2? rails_7_2?
end

RSpec.configure do |config|
  config.include(RailsVersions)
  config.extend(RailsVersions)
end
