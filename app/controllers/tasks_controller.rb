class TasksController < ApplicationController
  before_action :set_category, except: [:error]
  before_action :set_task, except: [:create, :error]

  def show
    redirect_to category_path(@category)
  end

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      flash[:notice] = "Task successfully added!"
      redirect_to category_path(@category)
    else
      flash[:alert] = "Oops, there was a problem adding a task. Please try again."
      redirect_back(fallback_location: category_path(@category))
    end
  end

  def edit
  end

  def update
    if @task.update(task_params)
      flash[:notice] = "Task item successfully updated!"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "Oops, there was a problem updating the task item. Please try again."
      render :edit, status: 422
    end
  end

  def destroy
    @task.destroy
    flash[:alert] = "Task permanently deleted."
    redirect_back(fallback_location: root_path)
  end

  def error
    flash[:alert] = "Hmm. Page not found."
    redirect_to root_path
  end

  private

  def task_params
    params
      .require(:task)
      .permit(:task_item, :due_date, :is_completed, :category_id)
  end

  def set_category
    @category = current_user.categories.find(params[:category_id])
  end

  def set_task
    @task = @category.tasks.find(params[:id])
  end
end
