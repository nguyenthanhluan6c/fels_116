class UsersController < ApplicationController
  before_action :logged_in_user, except: [:new, :create]
  before_action :load_user, except: [:index, :new, :create]

  def index
    @users = User.paginate page: params[:page]
  end

  def show   
    @activities = @user.activities.order("created_at desc").paginate page: params[:page]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "users.success_registed" 
      redirect_to root_url      
    else
      render :new
    end
  end

  def edit
  end

  def destroy  
    if @user.destroy      
      flash[:success] = t "user_deleted"      
    else
      flash[:danger] = t "user_can_not_delete"     
    end
    redirect_to users_url
  end

  def update
    if @user.update_attributes user_params      
      flash[:success] = t "profile_updated"
      redirect_to @user
    else
      render :edit
    end
  end
 
  private
  def user_params
    params.require(:user).permit :name, :email, :password, :password_confirmation
  end

  def load_user
    @user = User.find params[:id]
  end
end
