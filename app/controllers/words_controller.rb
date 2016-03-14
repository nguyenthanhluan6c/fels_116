class WordsController < ApplicationController
  def index
    @categories = Category.all
    if category_id.present?
      @category = Category.find category_id      
      @filter_state = params[:filter_state] || Settings.category_type.all_words
      @words = Word.send @filter_state, current_user, @category
    else
      @words = Word.all
    end
    @words = @words.paginate page: params[:page]
  end

  private
  def category_id
    params.require(:category)[:category_id] if params.has_key?(:category)
  end
end
