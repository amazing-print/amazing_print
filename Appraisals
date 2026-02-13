# frozen_string_literal: true

if RUBY_PLATFORM != 'java' && RUBY_VERSION >= '3.2.0'
  appraise 'rails-main' do
    gem 'rails', github: 'rails/rails'
    gem 'sqlite3', '>= 2.1', platform: :mri
  end

  appraise 'rails-8.1' do
    # Waiting on ActiveRecord 8.1 support
    # gem 'activerecord-jdbcsqlite3-adapter', '~> 81.0', platform: :jruby
    gem 'rails', '~> 8.1.0'
    gem 'sqlite3', '>= 2.1', platform: :mri
  end

  appraise 'rails-8.0' do
    # Waiting on ActiveRecord 8.0 support
    # gem 'activerecord-jdbcsqlite3-adapter', '~> 80.0', platform: :jruby
    gem 'rails', '~> 8.0.0'
    gem 'sqlite3', '>= 2.1', platform: :mri
  end
end

appraise 'rails-7.2' do
  # Waiting on ActiveRecord 7.2 support
  gem 'activerecord-jdbcsqlite3-adapter', '~> 72.0', platform: :jruby
  gem 'rails', '~> 7.2.0'
  gem 'sqlite3', '~> 2.6', platform: :mri
end

if RUBY_VERSION < '3.4.0'
  appraise 'mongoid-7.0' do
    gem 'mongoid', '~> 7.0.0'
    gem 'concurrent-ruby', '1.3.4' # https://stackoverflow.com/a/79361034/3446655
  end

  appraise 'mongoid-8.0' do
    gem 'mongoid', '~> 8.0.0'
    gem 'concurrent-ruby', '1.3.4' # https://stackoverflow.com/a/79361034/3446655
  end

  appraise 'sequel-5.0' do
    gem 'jdbc-sqlite3', platform: :jruby
    gem 'sequel', '~> 5.0'
    gem 'sqlite3', '~> 1.4', platform: :mri
  end
end
