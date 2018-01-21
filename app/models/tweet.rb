class Tweet < ApplicationRecord
  validates :text_or_image, presence: true
  has_many :retweet_relationships
  has_many :users_retweeted_by, through: :retweet_relationships, source: :user
  belongs_to :user
  counter_culture :user

  mount_uploader :image, TweetImageUploader

  def retweeted_by?(users_list)
    value = false

    users_list.each do |user|
      if users_retweeted_by.include?(user)
        value = true
      end
    end

    return value

  end

  def recent_retweeted_user(users_list)

    most_recent = -1

    users_list.each_with_index do |user,index|
      a_list = []
      a_list[0] = user
      if retweeted_by?(a_list) then
        if most_recent = -1 then
          most_recent = index
        else
          if retweet_relationships.find_by(user_id: user.id).created_at >= retweet_relationships.find_by(user_id: users_list[most_recent].id).created_at then
            most_recent = index
          end
        end
      end

    end

    return users_list[most_recent]

  end

  private

  def text_or_image
    tweet.presence or image.presence
  end

end
