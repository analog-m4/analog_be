class Api::V1::UsersController < ApplicationController
  def index
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end

  def create
    user = User.new(user_params)
    if user.save
      render json: { success: "User Created Successfully" }
    else
      render json: { failure: "User Could Not Be Created" }
    end
  end

  private

  def user_params
    params.permit(:username, :email)
  end
end