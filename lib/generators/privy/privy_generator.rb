require 'rails/generators'
require 'rails/generators/migration'

class PrivyGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  def self.source_root
    File.join(File.dirname(__FILE__), 'templates')
  end

  def self.next_migration_number(dirname)
    return Time.now.utc.strftime("%Y%m%d%H%M%S") if ActiveRecord::Base.timestamped_migrations
    "%.3d" % (current_migration_number(dirname) + 1)
  end

  def copy_initializer_file
    copy_file 'initializer.rb', 'config/initializers/privy.rb'
  end


  def create_users_table_migration
    migration_template 'migration.rb', 'db/migrate/create_privy_users_table.rb'
  end
end