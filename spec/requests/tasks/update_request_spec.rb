require "rails_helper"

describe "update a projects task" do
  it "updates an existing taskss information" do
    user = User.create!(username: "User", email: "user@email.com")
    project1 = user.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )
    task1 = project1.tasks.create!(title: "Task 1", description: "This is the first task", priority: 0)
    task = {
      "status": 1
    }
    patch api_v1_user_project_task_path(user, project1, task1), params: task, as: :json

    expect(response).to be_successful

    updated_task = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(updated_task).to be_a Hash
    expect(updated_task.keys).to eq([:id, :type, :attributes])
    expect(updated_task[:id]).to be_a String
    expect(updated_task[:type]).to be_a String
    expect(updated_task[:attributes]).to be_a Hash
    expect(updated_task[:attributes].keys).to eq([:project_id, :title, :description, :priority, :status])
    expect(updated_task[:attributes][:project_id]).to be_an Integer
    expect(updated_task[:attributes][:title]).to be_an String
    expect(updated_task[:attributes][:description]).to be_an String
    expect(updated_task[:attributes][:priority]).to be_an String
    expect(updated_task[:attributes][:status]).to eq("doing")
  end
end