class Api::V1::UsersController < ApplicationController
  def index
    render json: UserSerializer.new(User.all)
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end

  def create
    user = User.create!(user_params)
    render json: UserSerializer.new(user), status: 201
  end

  def update
    user = User.find(params[:id])
    user.update!(user_params)
    render json: UserSerializer.new(user)
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: { success: "User Deleted" }
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