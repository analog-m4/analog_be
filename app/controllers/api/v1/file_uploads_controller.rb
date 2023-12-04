class Api::V1::FileUploadsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  def index
    @files = FileUpload.all

    render json: @files
  end

  def show 
    render json: @file
  end

  def create
    @file = FileUpload.new(file_params)

      if @file.save
        render json: @file, status: :created, location: @file
      else
        render json: @file.errors, status: :unprocessable_entity
      end
  end

  def destroy
    @file.destroy
  end

  private

  def set_file
    @file= FileUpload.find(params[:id])
  end

  def post_params
    params.require(:file_upload).permit(:name, :document)
  end
end


