class TaskSerializer
  include JSONAPI::Serializer
  attributes :project_id, :title, :description, :priority, :status
end