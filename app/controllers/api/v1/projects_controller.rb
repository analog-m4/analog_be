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
    project = Project.new(project_params)
    if project.save
      render json: ProjectSerializer.new(project)
    else
      render json: { failure: "Project Could Not Be Created" }
    end
  end

  def update
    project = Project.find(params[:id])
    project.update(project_params)
    render json: ProjectSerializer.new(project)
  end

  def destroy
    if Project.ids.any? {|id| id == params[:id].to_i}
      Project.destroy(params[:id])
      render json: { success: "Project Deleted" }
    else
      render json: { failure: "ID Not Found" }
    end
  end

  private

  def project_params
    params.permit(:user_id, :title, :description, :color, :deadline, :status)
  end
end