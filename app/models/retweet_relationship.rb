class RetweetRelationship < ApplicationRecord
  belongs_to :user
  belongs_to :tweet

  counter_culture :tweet, column_name: "retweet_count"

end
