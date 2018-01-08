class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, uniqueness: true, presence: true
  validates :nickname, presence: true

  mount_uploader :image_avatar, ImageUploader
  mount_uploader :image_canopy, CanopyUploader

  has_many :tweets

  def to_param
    name
  end

end
