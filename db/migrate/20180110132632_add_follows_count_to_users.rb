class AddFollowsCountToUsers < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :follows_count, :integer, null: false, default:  0
  end

  def self.down
    remove_column :users, :follows_count
  end
end
