class TasksController < ApplicationController
  before_action :set_task

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

  def destroy
    @task.destroy
    flash[:alert] = "Task permanently deleted."
    redirect_to category_path(@category)
  end

  private

  def set_task
    @category = Category.find(params[:category_id])
    @task = Task.find(params[:id])
  end

  def task_params
    params
      .require(:task)
      .permit(:task_item, :due_date, :is_completed)
  end
end
