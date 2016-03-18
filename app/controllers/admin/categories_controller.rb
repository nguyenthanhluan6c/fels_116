class Admin::CategoriesController < Admin::BaseController 
  before_action :load_category, only: [:destroy, :edit, :update]

  def index
   @categories = Category.paginate page: params[:page]
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new category_params
    if @category.save
      flash[:success] = t "category.success_created" 
      redirect_to admin_categories_path      
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @category.update_attributes category_params      
      flash[:success] = t "category_updated"
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy 
    if @category.destroy      
      flash[:success] = t "category_deleted"      
    else
      flash[:danger] = t "category_can_not_delete"     
    end
    redirect_to admin_categories_path
  end

  private
  def category_params
    params.require(:category).permit :name, :description, :number_of_words_in_lesson,
      words_attributes: [:id, :name, :_destroy, word_options_attributes:[:id,
      :content, :is_correct, :_destroy]]
  end
  
  def load_category
    @category = Category.find_by id: params[:id]
  end
end
