class CreatePrivyUsersTable < ActiveRecord::Migration
  def self.up
    create_table :privy_users do |t|
      t.string :username, :null => false
      t.string :password, :null => false, :limit => 36
      t.string :salt,     :null => false, :limit => 4

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end