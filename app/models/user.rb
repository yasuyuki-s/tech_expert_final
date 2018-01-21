class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, uniqueness: true, presence: true
  validates :nickname, presence: true

  mount_uploader :image_avatar, ImageUploader
  mount_uploader :image_canopy, CanopyUploader

  has_many :tweets, dependent: :destroy

  has_many :follow_active_relationships, class_name: "FollowRelationship", foreign_key: :follow_by_id, dependent: :destroy
  has_many :follow_passive_relationships, class_name: "FollowRelationship", foreign_key: :follow_to_id, dependent: :destroy
  has_many :follows, through: :follow_active_relationships, source: :follow_to
  has_many :followers, through: :follow_passive_relationships, source: :follow_by

  has_many :retweet_relationships, dependent: :destroy
  has_many :retweets, through: :retweet_relationships, source: :tweet

  def to_param
    name
  end

  def follow!(other_user)
    follow_active_relationships.create!(follow_to_id: other_user.id)
  end

  def unfollow!(other_user)
    follow_active_relationships.find_by(follow_to_id: other_user.id).destroy
  end

  def following?(other_user)
    follows.include?(other_user)
  end

end
