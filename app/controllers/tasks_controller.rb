 class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]

  def create
    p task_params
    @task = @project.tasks.create(name: task_params[:name], order: @project.tasks.count)
    redirect_to root_url
  end

  def destroy
    if @task.destroy
      flash[:success] = "Task was deleted succesfullly."
    else
      flash[:error] = "Task could not be deleted."
    end
    redirect_to root_url
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to root_url, notice: "Todo item completed"
  end

  private

  def set_project
    @project = Project.find(params[:project_id])
  end

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def task_params
    params[:task].permit(:name)
  end

end
#     t.string   "name"
#     t.boolean  "status"
#     t.integer  "order"
#     t.integer  "project_id"
#     t.datetime "created_at"
#     t.datetime "updated_at"
#     t.datetime "completed_at"
#     t.datetime "deadline_at"