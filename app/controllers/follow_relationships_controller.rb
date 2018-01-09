class FollowRelationshipsController < ApplicationController

  def create
    user = User.find(params[:follow_to_id])
    current_user.follow!(user)

    redirect_to root_path
  end

  def destroy
    user = User.find(params[:follow_to_id])
    current_user.unfollow!(user)

    redirect_to root_path
  end

end
