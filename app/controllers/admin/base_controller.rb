class Admin::BaseController < ApplicationController
  before_action :logged_in_user
  before_action :verify_admin

  private
  def verify_admin
    unless current_user.is_admin?
      flash[:danger] = t "verify_admin"
      redirect_to root_path
    end
  end
end
