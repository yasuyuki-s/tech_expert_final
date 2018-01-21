class Tweet < ApplicationRecord
  validates :text_or_image, presence: true
  belongs_to :user
  counter_culture :user

  mount_uploader :image, TweetImageUploader

  private

  def text_or_image
    tweet.presence or image.presence
  end

end
