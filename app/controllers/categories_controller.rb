class CategoriesController < ApplicationController
  before_action :require_login
  before_action :set_category, only: %i[show edit update destroy]
  before_action :require_owner_category, only: %i[edit update destroy]

  def index
    @categories = current_user.categories.order(:name)
  end

  def show
    @todos = @category.todos.order(created_at: :desc)
  end

  def new
    @category = Category.new
  end

  def create
    @category = current_user.categories.build(category_params)
    if @category.save
      redirect_to @category, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      redirect_to @category, notice: "Category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy!
    redirect_to categories_path, notice: "Category and its ToDos were deleted.", status: :see_other
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def require_owner_category
    require_owner(@category)
  end

  def category_params
    params.require(:category).permit(:name, :description)
  end
end
