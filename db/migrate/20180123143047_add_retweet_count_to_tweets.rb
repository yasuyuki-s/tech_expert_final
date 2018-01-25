class AddRetweetCountToTweets < ActiveRecord::Migration[5.0]
  def self.up
    add_column :tweets, :retweet_count, :integer, null: false, default:  0
  end

  def self.down
    remove_column :tweets, :retweet_count
  end
end
