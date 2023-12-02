class Api::V1::TasksController < ApplicationController
  def index
    project = Project.find(params[:project_id])
    render json: TaskSerializer.new(project.tasks)
  end

  def show
    task = Task.find(params[:id])
    render json: TaskSerializer.new(task)
  end

  def create
    task = Task.new(task_params)
    if task.save
      render json: TaskSerializer.new(task)
    else
      render json: { failure: "Task Could Not Be Created" }
    end
  end

  def update
    task = Task.find(params[:id])
    task.update(task_params)
    render json: TaskSerializer.new(task)
  end

  def destroy
    if Task.ids.any? {|id| id == params[:id].to_i}
      Task.destroy(params[:id])
      render json: { success: "Task Deleted" }
    else
      render json: { failure: "ID Not Found" }
    end
  end

  private

  def task_params
    params.permit(:project_id, :title, :description, :priority, :status)
  end
end