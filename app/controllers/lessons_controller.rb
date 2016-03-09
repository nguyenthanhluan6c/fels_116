class LessonsController < ApplicationController
  def create    
    @category = Category.find params[:category_id]
    @lesson = current_user.lessons.build category_id: @category.id   
    if @lesson.save
      @lesson.build_lesson_results    
      redirect_to [@category, @lesson]
    else
      flash[:danger] = t "user_can_not_take_lesson"
      redirect_to root_url
    end    
  end

  def show
    @lesson = Lesson.find params[:id]
    @words = @lesson.words
  end
end
