# frozen_string_literal: true

if ExtVerifier.has_rails?
  # Required to use the column support
  module Rails
    def self.env
      {}
    end
  end

  # Establish connection to in-memory SQLite DB
  ActiveRecord::Base.establish_connection adapter: 'sqlite3', database: ':memory:'

  # Create the users table
  ActiveRecord::Migration.verbose = false
  ActiveRecord::Migration.create_table :users do |t|
    t.string :name
    t.integer :rank
    t.boolean :admin
    t.datetime :created_at
  end

  ActiveRecord::Migration.create_table :emails do |t|
    t.references :user
    t.string :email_address
  end

  ActiveRecord::Migration.create_table :wizards do |t|
    t.string :name
    t.datetime :created_at
    t.datetime :updated_at
    t.integer :spells_count
  end

  ActiveRecord::Migration.create_table :spells do |t|
    t.references :wizard
    t.string :name
  end

  # Create models
  class User < ActiveRecord::Base; has_many :emails; end

  class SubUser < User; end

  class Email < ActiveRecord::Base
    belongs_to :user
  end

  class Wizard < ActiveRecord::Base
    has_many :spells
  end

  class Spell < ActiveRecord::Base
    belongs_to :wizard, counter_cache: true
  end

  class TableFreeModel
    include ::ActiveModel::Validations
    attr_reader(:name)

    def attributes
      { 'name' => name }
    end
  end

  class ActiveModelModel
    include ::ActiveModel::Model
    include ::ActiveModel::Attributes
    attribute :name, :string
    attribute :rank, :integer, default: 0
  end
end
