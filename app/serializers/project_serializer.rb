class ProjectSerializer
  include JSONAPI::Serializer
  attributes :user_id, :title, :description, :color, :status, :deadline
end