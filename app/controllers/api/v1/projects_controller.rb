class Api::V1::ProjectsController < ApplicationController
  def index
    user = User.find(params[:user_id])
    render json: ProjectSerializer.new(user.projects)
  end

  def show
    project = Project.find(params[:id])
    render json: ProjectSerializer.new(project)
  end

  def create
    project = Project.create!(project_params)
    render json: ProjectSerializer.new(project), status: 201
  end

  def update
    project = Project.find(params[:id])
    project.update!(project_params)
    render json: ProjectSerializer.new(project)
  end

  def destroy
    project = Project.find(params[:id])
    project.destroy
    render json: { success: "Project Deleted" }
  end

  private

  def project_params
    params.permit(:user_id, :title, :description, :color, :deadline, :status)
  end
end