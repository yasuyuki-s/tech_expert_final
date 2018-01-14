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
|tweets_count|integer|null: false|
|follows_count|integer|null: false|
|followers_count|integer|null: false|

その他deviseで使用されるColumns

### Association
- has_many :follow_active_relationships, class_name: "FollowRelationship", foreign_key: :follow_by_id, dependent: :destroy
- has_many :follow_passive_relationships, class_name: "FollowRelationship", foreign_key: :follow_to_id, dependent: :destroy
- has_many :follows, through: :follow_active_relationships, source: :follow_to
- has_many :followers, through: :follow_passive_relationships, source: :follow_by
- has_many :tweets, dependent: :destroy

以下は未実装
- has_many :like_relationships, dependent: :destroy
- has_many :tweets_likes_to, through: :like_relationships, source: :tweet
- has_many :retweet_relationships, dependent: :destroy
- has_many :tweets_retweets_to, through: :retweet_relationships, source: :tweet

## tweetsテーブル

|Column|Type|Options|
|------|----|-------|
|tweet|text|null: false, index: true|
|image|string||
|user_id|integer|null: false, foreign_key: true|

### Association

- belongs_to :user
- counter_culture :user

以下未実装
- has_many :reply_active_relationships, class_name: "replyRelationship", foreign_key: :reply_by_tweet_id, dependent: :destroy
- has_many :reply_passive_relationships, class_name: "replyRelationship", foreign_key: :reply_to_tweet_id, dependent: :destroy
- has_one :tweet_replies_to, through: :reply_active_relationships, source: :reply_to_tweet
- has_one :user_replies_to, through: :reply_passive_relationships, source: reply_to_user
- has_many :tweets_replyed_by, through: :tweet_replyed, source: :reply_by_tweet
- has_many :like_relationships, dependent: :destroy
- has_many :users_liked_by, through: :like_relationships, source: :user
- has_many :retweet_relationships, dependent: :destroy
- has_many :users_retweeted_by, through: :retweet_relationships, source: :user

## follow_relationshipsテーブル

|Column|Type|Options|
|------|----|-------|
|follow_by_id|integer|null: false, foreign_key: users|
|follow_to_id|integer|null: false, foreign_key: users|

### Association
- belongs_to :follow_by, class_name: "User"
- belongs_to :follow_to, class_name: "User"

- counter_culture :follow_by, column_name: "follows_count"
- counter_culture :follow_to, column_name: "followers_count"

## reply_relationshipsテーブル　未実装

|Column|Type|Options|
|------|----|-------|
|reply_by_tweet_id|integer|null: false, foreign_key: tweets|
|reply_to_tweet_id|integer|foreign_key: tweets|
|reply_to_user_id|integer|null: false, foreign_key: users|

### Association
- belongs_to :reply_by_tweet, class_name: "Tweet"
- belongs_to :reply_to_tweet, class_name: "Tweet"
- belongs_to :reply_to_user, class_name: "User"

## like_relationshipsテーブル　未実装

|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|null: false, foreign_key: tweets|
|user_id|integer|null: false, foreign_key: users|

### Association
- belongs_to :tweet
- belongs_to :user

## retweet_relationshipsテーブル　未実装

|Column|Type|Options|
|------|----|-------|
|tweet_id|integer|null: false, foreign_key: tweets|
|user_id|integer|null: false, foreign_key: users|

### Association
- belongs_to :tweet
- belongs_to :user
