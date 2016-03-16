class Admin::UsersController < Admin::BaseController
  before_action :load_user, only: [:destroy, :update]

  def index
    @users = User.paginate page: params[:page]
  end

  def destroy  
    if @user.destroy      
      flash[:success] = t "user_deleted"      
    else
      flash[:danger] = t "user_can_not_delete"     
    end
    redirect_to admin_users_url
  end
 
  private
  def load_user
    @user = User.find_by id: params[:id]
  end
end
