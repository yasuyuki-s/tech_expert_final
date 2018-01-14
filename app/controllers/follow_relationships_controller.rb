class FollowRelationshipsController < ApplicationController

  def create
    user = User.find(params[:follow_to_id])
    if current_user.follow!(user)
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json
      end
    end
  end

  def destroy
    user = User.find(params[:follow_to_id])
    if current_user.unfollow!(user)
      respond_to do |format|
        format.html {redirect_to root_path}
        format.json
      end
    end
  end

end
