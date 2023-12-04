class Api::V1::FileUploadsController < ApplicationController
  def index
    uploads = FileUpload.find_by(params[:user_id])
    render json: SearchedFileUploadsSerializer.new(uploads)
  end

  def create
    @upload = FileUploadModel.new(file_params)

      if @upload.save
        @upload.file.attach(params[:document])
        serialized_upload = SearchedFileUploadsSerializer.new(@upload).serialable_hash
        render json: @upload, status: :created
      else
        render json: { errors: @upload.errors.full_messages }, status: :unprocessable_entity
      end
  end

  def destroy
    file_upload = FileUpload.find_by(upload_id: params[:upload_id])
    file_upload.destroy
    render json: {}, status: 200
    #No error handling yet
  end

  private

  #Add callbacks later for refactoring?

  def file_params
    params.require(:file_upload).permit(:name, :document)
  end
end


