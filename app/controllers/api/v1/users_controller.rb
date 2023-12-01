class Api::V1::UsersController < ApplicationController
  def index
  end

  def show
    user = User.find(params[:id])
    render json: UserSerializer.new(user)
  end
end