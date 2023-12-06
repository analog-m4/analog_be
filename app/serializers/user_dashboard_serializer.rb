class UserDashboardSerializer
include JSONAPI::Serializer

set_type :dashboard
set_id :id

attributes :username, :email

    attribute :projects do |user|
        user.projects.map do |project|
            {
                id: project.id,
                title: project.title,
                description: project.description,
                color: project.color,
                status: project.status,
                deadline: project.deadline,
                tasks: project.tasks.map do |task|
                    {
                        id: task.id,
                        title: task.title,
                        description: task.description,
                        priority: task.priority,
                        status: task.status,
                        project_id: task.project_id
                    }
                end
            }
        end
    end
end