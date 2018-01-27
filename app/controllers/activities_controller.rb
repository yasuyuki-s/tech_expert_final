class ActivitiesController < ApplicationController
  before_action :set_user, only: [:index, :following, :followers]

  def index

  end

  def following

  end

  def followers

  end

  def set_user
    @user = User.find_by(name: params[:user_name])
    @tweet = Tweet.new
  end
end
