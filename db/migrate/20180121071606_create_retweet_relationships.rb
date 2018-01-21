class CreateRetweetRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :retweet_relationships do |t|
      t.references :tweet, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
