class Tweet < ApplicationRecord
  validates :text_or_image, presence: true
  has_many :retweet_relationships, dependent: :destroy
  has_many :users_retweeted_by, through: :retweet_relationships, source: :user
  belongs_to :user
  counter_culture :user

  mount_uploader :image, TweetImageUploader

  def created_at_between_hour?(from,to)
    if created_at.hour >= from and created_at.hour < to then
      return true
    else
      return false
    end
  end

  def retweeted_by?(user_id_list)
    value = false

    retweeter_id_list = users_retweeted_by.pluck(:id)
    user_id_list.each do |user_id|
      if retweeter_id_list.include?(user_id)
        value = true
      end
    end

    return value

  end

  def recent_retweeted_user(user_id_list)

    most_recent = -1
    current = 0
    user_id_list.each_with_index do |user_id,index|
      a_list = []
      a_list[0] = user_id
      if retweeted_by?(a_list) then
        if most_recent == -1 then
          most_recent = index
          current = retweet_relationships.find_by(user_id: user_id).created_at
        else
          candidate = retweet_relationships.find_by(user_id: user_id).created_at
          if candidate >= current then
            most_recent = index
            current = candidate
          end
        end
      end
    end

    return User.find(user_id_list[most_recent])

  end

  private

  def text_or_image
    tweet.presence or image.presence
  end

end
