require "rails_helper"

describe "create a projects tasks" do
  it "returns the newly created tasks information" do
    user = User.create!(username: "User", email: "user@email.com")
    project1 = user.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )
    task = {
      "title": "Task 1",
      "description": "A New Task",
      "priority": 1
    }
    post api_v1_user_project_tasks_path(user, project1), params: task, as: :json

    expect(response).to be_successful

    new_task = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(new_task).to be_a Hash
    expect(new_task.keys).to eq([:id, :type, :attributes])
    expect(new_task[:id]).to be_a String
    expect(new_task[:type]).to be_a String
    expect(new_task[:attributes]).to be_a Hash
    expect(new_task[:attributes].keys).to eq([:project_id, :title, :description, :priority, :status])
    expect(new_task[:attributes][:project_id]).to be_an Integer
    expect(new_task[:attributes][:title]).to be_an String
    expect(new_task[:attributes][:description]).to be_an String
    expect(new_task[:attributes][:priority]).to be_an String
    expect(new_task[:attributes][:status]).to be_an String
  end

  it "returns an error if all information isn't provided" do
    user = User.create!(username: "User", email: "user@email.com")
    project1 = user.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )
    task = {
      "title": "Task 1",
    }
    post api_v1_user_project_tasks_path(user, project1), params: task, as: :json

    expect(response.status).to eq(422)

    message = JSON.parse(response.body, symbolize_names: true)

    expect(message).to be_a Hash
    expect(message[:error]).to eq(["Description can't be blank", "Priority can't be blank"])
  end
end