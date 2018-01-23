class RetweetRelationshipsController < ApplicationController

  def create
    tweet = Tweet.find(params[:tweet_id])
    if current_user.retweet!(tweet)
      @retweet_count = tweet.retweet_count
      respond_to do |format|
        format.json
      end
    end
  end

  def destroy
    tweet = Tweet.find(params[:tweet_id])
    if current_user.unretweet!(tweet)
      @retweet_count = tweet.retweet_count
      respond_to do |format|
        format.json
      end
    end
  end
end
