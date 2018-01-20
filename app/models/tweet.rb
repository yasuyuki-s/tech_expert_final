class Tweet < ApplicationRecord
  validates :tweet, presence: true

  belongs_to :user
  counter_culture :user

  mount_uploader :image, TweetImageUploader

end
