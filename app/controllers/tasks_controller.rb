class TasksController < ApplicationController
  before_action :set_category
  before_action :set_task, except: [:create]

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to category_path(@category)
    else
      flash[:alert] = "Oops, there was a problem adding a task. Please try again."
      render :new, status: 422
    end
  end

  def edit
  end

  def update
    if @category.tasks.update(task_params)
      flash[:notice] = "Task item successfully updated!"
      redirect_to category_path(@category)
    else
      flash[:alert] = "Oops, there was a problem updating the task item. Please try again."
      render :edit, status: 422
    end
  end

  def destroy
    @task.destroy
    flash[:alert] = "Task permanently deleted."
    redirect_to category_path(@category)
  end

  private

  def task_params
    params
      .require(:task)
      .permit(:task_item, :due_date, :is_completed)
  end

  def set_category
    @category = Category.find(params[:category_id])

  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Oh no! The category you were looking for does not exist."
    redirect_to categories_path
  end

  def set_task
    @task = Task.find(params[:id])

  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "Oh no! The task you were looking for does not exist."
    redirect_to category_path(@category)
  end
end
