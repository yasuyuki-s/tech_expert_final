class ChangeColumnToTweet < ActiveRecord::Migration[5.0]
  def change

    change_column :tweets, :tweet, :text, null: true

  end
end
