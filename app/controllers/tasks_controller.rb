class TasksController < ApplicationController
  before_action :set_task

  def create
    @task = @category.tasks.build(task_params)

    if @task.save
      flash[:notice] = "Category successfully added!"
      redirect_to category_path(@category)
    else
      flash[:alert] = "Oops, there was a problem submitting the form. Please try again."
      render :new, status: 422
    end

  end

  private

  def set_task
    @category = Category.find(params[:category_id])
  end

  def task_params
    params
      .require(:task)
      .permit(:task_item, :due_date, :is_completed)
  end
end
