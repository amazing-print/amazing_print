# frozen_string_literal: true

if RUBY_PLATFORM != 'java'
  appraise 'rails-7.2' do
    # Waiting on ActiveRecord 7.2 support
    # gem 'activerecord-jdbcsqlite3-adapter', '~> 72.0', platform: :jruby
    gem 'rails', '~> 7.2.0'
    gem 'sqlite3', '~> 2.6', platform: :mri
  end
end

appraise 'rails-7.1' do
  gem 'activerecord-jdbcsqlite3-adapter', '~> 71.0', platform: :jruby
  gem 'rails', '~> 7.1.0'
  gem 'sqlite3', '~> 2.6', platform: :mri
end

if RUBY_VERSION < '3.4.0'
  appraise 'rails-7.0' do
    gem 'activerecord-jdbcsqlite3-adapter', '~> 70.0', platform: :jruby
    gem 'concurrent-ruby', '1.3.4' # https://stackoverflow.com/a/79361034/3446655
    gem 'rails', '~> 7.0.0'
    gem 'sqlite3', '~> 1.4', platform: :mri
  end

  appraise 'mongoid-7.0' do
    gem 'mongoid', '~> 7.0.0'
    gem 'concurrent-ruby', '1.3.4' # https://stackoverflow.com/a/79361034/3446655
  end

  appraise 'mongoid-8.0' do
    gem 'mongoid', '~> 8.0.0'
    gem 'concurrent-ruby', '1.3.4' # https://stackoverflow.com/a/79361034/3446655
  end

  appraise 'rails-6.1' do
    gem 'activerecord-jdbcsqlite3-adapter', '~> 61.0', platform: :jruby
    gem 'concurrent-ruby', '1.3.4' # https://stackoverflow.com/a/79361034/3446655
    gem 'rails', '~> 6.1.0'
    gem 'sqlite3', '~> 1.4', platform: :mri
  end

  appraise 'sequel-5.0' do
    gem 'jdbc-sqlite3', platform: :jruby
    gem 'sequel', '~> 5.0'
    gem 'sqlite3', '~> 1.4', platform: :mri
  end
end
