class FollowRelationship < ApplicationRecord
  belongs_to :follow_by, class_name: "User"
  belongs_to :follow_to, class_name: "User"

  counter_culture :follow_by, column_name: "follows_count"
  counter_culture :follow_to, column_name: "followers_count"

end
