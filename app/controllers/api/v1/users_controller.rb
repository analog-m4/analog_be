class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: UserSerializer.new(user)
    else
      render json: { failure: "User Could Not Be Created" }
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    render json: UserSerializer.new(user)
  end

  def destroy
    if User.ids.any? {|id| id == params[:id].to_i}
      User.destroy(params[:id])
      render json: { success: "User Deleted" }
    else
      render json: { failure: "ID Not Found" }
    end
  end

  def dashboard
    user = User.includes(projects: :tasks).find(params[:id])
    render json: UserDashboardSerializer.new(user)
  end
  private

  def user_params
    params.permit(:username, :email)
  end
end