# frozen_string_literal: true

# appraise 'rails-4.2' do
#   gem 'rails', '~> 4.2.0'
#
#   # The last version that doesn't need Ruby 2.0 and works with version 4.2 of
#   # Rails. This addresses a build problem with Travis for version 1.9.3 of Ruby
#   gem 'mime-types', '2.6.2', :platforms => :ruby_19
# end

appraise 'rails-5.1' do
  gem 'activerecord-jdbcsqlite3-adapter', '~> 51.0', platform: :jruby
  gem 'rails', '~> 5.1.0'
  gem 'sqlite3', platform: :mri
end

appraise 'rails-5.2' do
  gem 'activerecord-jdbcsqlite3-adapter', '~> 52.0', platform: :jruby
  gem 'rails', '~> 5.2.0'
  gem 'sqlite3', platform: :mri
end

appraise 'rails-6.0' do
  gem 'activerecord-jdbcsqlite3-adapter', '~> 60.0', platform: :jruby
  gem 'rails', '~> 6.0.0'
  gem 'sqlite3', platform: :mri
end

appraise 'mongoid-4.0' do
  # https://github.com/rails/rails/issues/34822#issuecomment-570670516
  gem 'bigdecimal', '~> 1.4', platforms: :mri
  gem 'mongoid', '~> 4.0.0'
end

appraise 'mongoid-5.0' do
  # https://github.com/rails/rails/issues/34822#issuecomment-570670516
  gem 'bigdecimal', '~> 1.4', platforms: :mri
  gem 'mongoid', '~> 5.0.0'
end

appraise 'mongoid-6.0' do
  gem 'mongoid', '~> 6.0.0'
end

appraise 'sequel-5.0' do
  gem 'jdbc-sqlite3', platform: :jruby
  gem 'sequel', '~> 5.0'
  gem 'sqlite3', platform: :mri
end

appraise 'mongo_mapper' do
  gem 'activemodel', '~> 4.2.0'
  gem 'activesupport', '~> 4.2.0'
  gem 'bigdecimal', '~> 1.4'
  gem 'mongo_mapper', '~> 0.14'
end

# appraise 'ripple' do
#   gem 'tzinfo'
#   gem 'ripple'
# end
#
# appraise 'nobrainer' do
#   gem 'nobrainer'
#
#   # When activesupport 5 was released, it required ruby 2.2.2 as a minimum.
#   # Locking this down to 4.2.6 allows our Ruby 1.9 tests to keep working.
#   gem 'activesupport', '4.2.6', :platforms => :ruby_19
# end
