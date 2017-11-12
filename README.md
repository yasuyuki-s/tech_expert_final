# DB設計
## usersテーブル

|Column|Type|Options|
|------|----|-------|
|name|string|null: false, index: true, unique: true|
|nickname|string|null: false, index: true|
|email|string|null: false, unique: true|
|biography|text||
|image_avatar|string||
|image_canopy|string||

その他deviseで使用されるColumns

### Association
- has_many :follow_active_relationships, class_name: "FollowRelationship", foreign_key: :follow_by_user_id, dependent: :destroy
- has_many :follow_passive_relationships, class_name: "FollowRelationship", foreign_key: :follow_to_user_id, dependent: :destroy
- has_many :follows, through: :follow_active_relationships, source: :follow_to_user
- has_many :followers, through: :follow_passive_relationships, source: :follow_by_user
- has_many :like_relationships, dependent: :destroy
- has_many :tweets_likes_to, through: :like_relationships, source: :tweet
- has_many :retweet_relationships, dependent: :destroy
- has_many :tweets_retweets_to, through: :retweet_relationships, source: :tweet
- has_many :tweets

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|tweet|text|null: false, index: true|
|image|string||
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many :reply_active_relationships, class_name: "replyRelationship", foreign_key: :reply_by_tweet_id, dependent: :destroy
- has_many :reply_passive_relationships, class_name: "replyRelationship", foreign_key: :reply_to_tweet_id, dependent: :destroy
- has_one :tweet_replies_to, through: :reply_active_relationships, source: :reply_to_tweet
- has_one :user_replies_to, through: :reply_passive_relationships, source: reply_to_user
- has_many :tweets_replyed_by, through: :tweet_replyed, source: :reply_by_tweet
- has_many :like_relationships, dependent: :destroy
- has_many :users_liked_by, through: :like_relationships, source: :user
- has_many :retweet_relationships, dependent: :destroy
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

## reply_relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|reply_by_tweet_id|integer|null: false, foreign_key: tweets|
|reply_to_tweet_id|integer|foreign_key: tweets|
|reply_to_user_id|integer|null: false, foreign_key: users|

### Association
- belongs_to :reply_by_tweet, class_name: "Tweet"
- belongs_to :reply_to_tweet, class_name: "Tweet"
- belongs_to :reply_to_user, class_name: "User"

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
