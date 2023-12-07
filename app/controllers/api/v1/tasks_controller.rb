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
    task = Task.create!(task_params)
    render json: TaskSerializer.new(task)
  end

  def update
    task = Task.find(params[:id])
    task.update!(task_params)
    render json: TaskSerializer.new(task)
  end

  def destroy
    task = Task.find(params[:id])
    task.destroy
    render json: { success: "Task Deleted" }
  end

  private

  def task_params
    params.permit(:project_id, :title, :description, :priority, :status)
  end
end