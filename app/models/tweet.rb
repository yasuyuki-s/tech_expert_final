class Tweet < ApplicationRecord
  validates :tweet, presence: true

  belongs_to :user
  counter_culture :user

end
