class CategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_category, except: [:index, :create, :new]

  def index
    @categories = current_user.categories.all.order(created_at: :desc)
    @tasks_due_today = Task.due_today
  end

  def show
  end

  def new
    @category = current_user.categories.build
  end

  def create
    @category = current_user.categories.build(category_params)

    if @category.save
      flash[:notice] = "Category successfully added!"
      redirect_to root_path
    else
      flash[:alert] = "Oops, there was a problem adding a category. Please try again."
      render :new, status: 422
    end
  end

  def edit
  end

  def update
    if @category.update(category_params)
      flash[:notice] = "Category name successfully updated!"
      redirect_to categories_path
    else
      flash[:alert] = "Oops, there was a problem updating the category. Please try again."
      render :edit, status: 422
    end
  end

  def destroy
    if @category.destroy
      flash[:alert] = "Category permanently deleted."
      redirect_to categories_path
    else
      flash[:alert] = "Oops, there was a problem deleting the item. Please try again."
      render :index, status: 422
    end
  end

  private

  def category_params
    params.require(:category).permit(:category_name)
  end

  def set_category
    @category = current_user.categories.find(params[:id])
    @tasks = @category.tasks

  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Oh no! The category you were looking for does not exist."
    redirect_to root_path
  end
end
