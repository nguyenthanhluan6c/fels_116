class StaticPagesController < ApplicationController
  def home
    @feeds = current_user.feed.paginate page: params[:page] if logged_in?
  end

  def help
  end

  def about
  end
end
