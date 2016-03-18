class WordsController < ApplicationController
  def index
    @categories = Category.all
    @filter_state = params[:filter_state] || Settings.category_type.all_words
    if category_id.present?
      @category = Category.find category_id     
      @words = Word.send @filter_state, current_user, @category
    else
      @filter_state_no_category = "#{@filter_state}_no_category"
      @words = Word.send @filter_state_no_category, current_user
    end
    @words = @words.paginate page: params[:page]
  end

  private
  def category_id
    params.require(:category)[:category_id] if params.has_key?(:category)
  end
end
