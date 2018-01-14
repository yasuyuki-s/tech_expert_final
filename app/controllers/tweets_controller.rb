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
    params.require(:tweet).permit(:tweet)
  end

  def set_tweets
    user_list = [current_user.id]
    user_list.concat(current_user.follows.pluck(:id))

    tweets = Tweet.arel_table

    tweets_sel = tweets[:user_id].eq(user_list[0])

    for i in 1..user_list.length-1
       tweets_sel = tweets_sel.or(tweets[:user_id].eq(user_list[i]))
    end
    @tweets = Tweet.where(tweets_sel).includes(:user).order("created_at DESC")
  end
end
