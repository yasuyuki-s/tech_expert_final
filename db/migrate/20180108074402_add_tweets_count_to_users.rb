class AddTweetsCountToUsers < ActiveRecord::Migration[5.0]
  def self.up
    add_column :users, :tweets_count, :integer, null: false, default:  0
  end

  def self.down
    remove_column :users, :tweets_count
  end
end
