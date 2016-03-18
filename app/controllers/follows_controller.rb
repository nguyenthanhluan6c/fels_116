class FollowsController < ApplicationController
  def index    
    @user = User.find params[:user_id]
    if params[:option] == "following"
      @users = @user.following.paginate page: params[:page]
    else
      @users = @user.followers.paginate page: params[:page]
    end    
  end
end
