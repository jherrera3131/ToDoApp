class TodosController < ApplicationController
  before_action :require_login
  before_action :set_todo, only: %i[show edit update destroy]
  before_action :require_owner_todo, only: %i[edit update destroy]

  def index
    @todos = current_user.todos.includes(:category).order(created_at: :desc)
  end

  def completed
    @todos = current_user.todos.completed.includes(:category).order(updated_at: :desc)
  end

  def show
  end

  def new
    @todo = Todo.new
    @categories = current_user.categories.order(:name)
  end

  def create
    @todo = current_user.todos.build(todo_params)
    if @todo.save
      redirect_to @todo, notice: "ToDo was successfully created."
    else
      @categories = current_user.categories.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @categories = current_user.categories.order(:name)
  end

  def update
    if @todo.update(todo_params)
      redirect_to @todo, notice: "ToDo was successfully updated."
    else
      @categories = current_user.categories.order(:name)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @todo.destroy!
    redirect_to todos_path, notice: "ToDo was deleted.", status: :see_other
  end

  private

  def set_todo
    @todo = current_user.todos.find(params[:id])
  end

  def require_owner_todo
    require_owner(@todo)
  end

  def todo_params
    params.require(:todo).permit(:title, :priority, :completed, :category_id)
  end
end
