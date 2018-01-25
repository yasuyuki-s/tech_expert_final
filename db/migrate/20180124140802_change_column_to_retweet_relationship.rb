class ChangeColumnToRetweetRelationship < ActiveRecord::Migration[5.0]
  def change
    add_index :retweet_relationships, [:tweet_id, :user_id], unique: true
  end
end
