requir 'aws-sdk-s3'

class Api::V1::S3Controller < ApplicationController
  def index
    s3 = Aws::S3::Resource.new(region: '')
    bucket = ''
    objs = s3.bucket(bucket).object('')

    url = obj.presigned_url(:put, acl: 'public-read')
    
    render json: { upload_url: url}
  end
end
