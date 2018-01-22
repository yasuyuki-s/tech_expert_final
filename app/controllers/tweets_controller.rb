class TweetsController < ApplicationController
  before_action :set_tweets, only:[:create, :index]

  def index
    @tweet = Tweet.new
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:tweet,:image)
  end

  def set_tweets
    user_list = [current_user.id]
    user_list.concat(current_user.follows.pluck(:id))

    tweets = Tweet.arel_table
    users = User.arel_table

    tweets_sel = tweets[:user_id].eq(user_list[0])
    users_sel = users[:id].eq(user_list[0])

    order_sel = "CASE when "
    retweet_list = []
    retweeter_list = []
    user_list.each do |a_user_id|
      a_user = User.find(a_user_id)
      if a_user.retweets.present? then
        retweet_list.concat(a_user.retweets.pluck(:id))
        retweeter_list << a_user.id
      end
    end

    if retweeter_list.length == 0 then
      order_sel = "tweets.created_at DESC"
    else
      retweeter_list.each_with_index do |retweeter_id,index|
        if index == 0 then
          order_sel = order_sel + "retweet_relationships.user_id = #{retweeter_id} "
        else
          order_sel = order_sel + "or retweet_relationships.user_id = #{retweeter_id} "
        end
      end
      order_sel = order_sel + "then retweet_relationships.created_at else tweets.created_at end DESC"
    end

    for i in 0..retweet_list.length-1
      tweets_sel = tweets_sel.or(tweets[:id].eq(retweet_list[i]))
    end

    for i in 1..user_list.length-1
       tweets_sel = tweets_sel.or(tweets[:user_id].eq(user_list[i]))
       users_sel = users_sel.or(users[:id].eq(user_list[i]))
    end
    @tweets = Tweet.where(tweets_sel).includes(:user,:users_retweeted_by).eager_load(:retweet_relationships).order(order_sel)
    @users = User.where(users_sel)
  end


end
