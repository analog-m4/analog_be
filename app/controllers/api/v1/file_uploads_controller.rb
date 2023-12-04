class Api::V1::FileUploadsController < ApplicationController
  def index
    files = FileUploadsFacade.new(params[:user_id]).fetch_uploads
    render json: SearchedFileUploadsSerializer.new(uploads)
  end

  def show 
    file = FileUploadsFacade.new(user_id: params[:user_id], upload_id: params[:upload_id])
    render json: SearchedFileUploadsSerializer.new(uploads)
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
    file_upload = FileUpload.find_by(user_id: params[:user_id], upload_id: params[:upload_id])
    file_upload.destroy
    render json: {}, status: 200
    #No error handling yet
  end

  private

  def file_params
    params.require(:file_upload).permit(:name, :document)
  end
end


