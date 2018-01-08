class CreateTweets < ActiveRecord::Migration[5.0]
  def change
    create_table :tweets do |t|
      t.text    :tweet, null: false
      t.string  :image
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
