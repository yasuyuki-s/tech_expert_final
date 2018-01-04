class UsersController < ApplicationController
  before_action :set_user, only:[:show]

  def index

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

  def set_user
    @user = User.find_by(name: params[:name])
  end

end
