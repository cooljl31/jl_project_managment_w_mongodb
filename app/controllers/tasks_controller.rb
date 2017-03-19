class TasksController < ApplicationController
  before_action :find_project
  before_action :set_task, except: :create

  def create
    @task = @project.tasks.create(task_params)
    redirect_to @project
  end

  def destroy
    @task = @project.tasks.find(params[:id])

    if @task.destroy
      flash[:success] = 'Task deleted'
    else
      flash[:notice] = 'Task was not deleted'
    end
    redirect_to @project
  end

  def complete
    @task.update_attribute(:completed_at, Time.now)
    redirect_to @project, notice: 'Task Completed'
  end

  private

  def set_task
    @task = @project.tasks.find(params[:id])
  end

  def find_project
    @project = Project.find(params[:project_id])
  end

  def task_params
    params.require(:task).permit([:content])
  end
end
