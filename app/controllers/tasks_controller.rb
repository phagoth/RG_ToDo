 class TasksController < ApplicationController
  before_action :set_project
  before_action :set_task, except: [:create]
  before_filter :authenticate_user!

  def create
    @task = @project.tasks.create(name: task_params[:name], order: @project.tasks.count)
    
    respond_to do |format|
      if @task.save
        format.html { redirect_to root_path, notice: 'Task was successfully created.' }
        format.js   { }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @task.destroy
        format.html { redirect_to root_path, notice: 'Task was deleted succesfullly.' }
        format.js   { }
        format.json { head :no_content }
      end
    end
  end

  def complete
    respond_to do |format|
      if @task.update_attribute(:completed_at, Time.now)
        format.html { redirect_to root_path, notice: 'Todo item completed.' }
        format.js   { }
      end
    end
  end

  private

  def set_project
    begin
      @project = current_user.projects.find(params[:project_id])
    rescue Exception => e
      flash[:notice] = "ERROR"
      redirect_to root_path
      return
    end
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