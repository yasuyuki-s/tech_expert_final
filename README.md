# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, unique: true|
|email|string|null: false, unique: true|
|image_avatar|string||
|image_canopy|string||

### Association
- has_many :user_follows, class_name: "FollowRelationship", foreign_key: :follow_by_user_id, dependent: :destroy
- has_many :user_followed, class_name: "FollowRelationship", foreign_key: :follow_to_user_id, dependent: :destroy
- has_many :follows, through: :user_follows, source: :follow_to_user
- has_many :followers, through: :user_followed, source: :follow_by_user
- has_many :like_relationships
- has_many :tweets_likes_to, through: :like_relationships, source: :tweet
- has_many :retweet_relationships
- has_many :tweets_retweets_to, through: :retweet_relationships, source: :tweet
- has_many :tweets

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|tweet|string|null: false, index: true|
|image|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :tweet_comments, class_name: "CommentRelationship", foreign_key: :comment_by_tweet_id, dependent: :destroy
- has_many :tweet_commented, class_name: "CommentRelationship", foreign_key: :comment_to_tweet_id, dependent: :destroy
- has_one :tweet_comments_to, through: :tweet_comments, source: :comment_to_tweet
- has_one :user_comments_to, through: :tweet_comments, source: comment_to_user
- has_many :tweets_commented_by, through: :tweet_commented, source: :comment_by_tweet
- has_many :like_relationships
- has_many :users_liked_by, through: :like_relationships, source: :user
- has_many :retweet_relationships
- has_many :users_retweeted_by, through: :retweet_relationships, source: :user
- belongs_to :user

## follow_relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|follow_by_user_id|integer|null: false, foreign_key: users|
|follow_to_user_id|integer|null: false, foreign_key: users|

### Association
- belongs_to :follow_by_user, class_name: "User"
- belongs_to :follow_to_user, class_name: "User"

## comment_relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|comment_by_tweet_id|integer|null: false, foreign_key: tweets|
|comment_to_tweet_id|integer|foreign_key: tweets|
|comment_to_user_id|integer|null: false, foreign_key: users|

### Association
- belongs_to :comment_by_tweet, class_name: "Tweet"
- belongs_to :comment_to_tweet, class_name: "Tweet"
- belongs_to :comment_to_user, class_name: "User"

## like_relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|null: false, foreign_key: tweets|
|user_id|integer|null: false, foreign_key: users|

### Association
- belongs_to :tweet
- belongs_to :user

## retweet_relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|null: false, foreign_key: tweets|
|user_id|integer|null: false, foreign_key: users|

### Association
- belongs_to :tweet
- belongs_to :user
