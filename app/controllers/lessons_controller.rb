class LessonsController < ApplicationController
  before_action :load_lesson, only: [:show, :update]

  def create    
    @category = Category.find params[:category_id]
    @lesson = current_user.lessons.build category: @category  
    if @lesson.save      
      @lesson.build_lesson_results    
      redirect_to [@category, @lesson]
    else
      flash[:danger] = t "user_can_not_take_lesson"
      redirect_to root_url
    end    
  end

  def show   
    @results = @lesson.results    
  end

  def update    
    if @lesson.update_attributes lesson_params      
      flash[:success] = t "lesson_updated"
      @results = @lesson.results
      redirect_to [@lesson.category, @lesson]
    else
      flash[:danger] = t "can_not_update_lesson"
      redirect_to categories_path
    end
  end

  private
  def load_lesson
    @lesson = Lesson.find params[:id]    
  end

  def lesson_params
    params.require(:lesson).permit :id, :status, results_attributes: [ :id, :word_option_id]
  end
end
