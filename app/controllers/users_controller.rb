class UsersController < ApplicationController
  before_action :set_user, only:[:show, :update, :following, :followers]

  def show

  end

  def following
    @users = User.find_by(name: params[:name]).follows
  end

  def followers
    @users = User.find_by(name: params[:name]).followers
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(current_user)
    else
      render :show
    end
  end

  def check_name
    user = User.find_by(name: params[:name])
    @hit = user.present?
    respond_to do |format|
      format.json
    end
  end

  def check_email
    user = User.find_by(email: params[:email])
    @hit = user.present?
    respond_to do |format|
      format.json
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname,:biography,:image_avatar,:remove_image_avatar, :image_canopy, :remove_image_canopy)
  end

  def set_user
    @user = User.find_by(name: params[:name])

    retweet_list = @user.retweets.pluck(:id)

    tweets = Tweet.arel_table
    tweets_sel = tweets[:user_id].eq(@user.id)
    for i in 0..retweet_list.length-1
      tweets_sel = tweets_sel.or(tweets[:id].eq(retweet_list[i]))
    end

    order_sel = "CASE when retweet_relationships.user_id = #{@user.id} then retweet_relationships.created_at else tweets.created_at end DESC"

    @tweets = Tweet.where(tweets_sel).includes(:user).eager_load(:retweet_relationships).order(order_sel)
    @tweet = Tweet.new
    @retweeters_id = []
    @retweeters_id[0] = @user.id
  end

end
