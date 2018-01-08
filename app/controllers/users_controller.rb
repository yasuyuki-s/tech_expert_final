class UsersController < ApplicationController
  before_action :set_user, only:[:show,:update]

  def index

  end

  def show

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
  end

end
