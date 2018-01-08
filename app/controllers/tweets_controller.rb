class TweetsController < ApplicationController
  before_action :set_tweets, only:[:create, :index]


  def index
    @tweet = Tweet.new
    @tweets = current_user.tweets.order("created_at DESC")
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
    @tweets = tweets = current_user.tweets.order("created_at DESC")
  end
end
