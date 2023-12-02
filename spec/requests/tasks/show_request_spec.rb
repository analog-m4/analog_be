require "rails_helper"

describe "request a single tasks information" do
  it "returns the tasks information" do
    user = User.create!(username: "User", email: "user@email.com")
    project1 = user.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )
    task1 = project1.tasks.create!(title: "Task 1", description: "This is the first task", priority: 0)
    
    get api_v1_user_project_task_path(user, project1, task1)

    expect(response).to be_successful

    found_task = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(found_task).to be_a Hash
    expect(found_task.keys).to eq([:id, :type, :attributes])
    expect(found_task[:id]).to be_a String
    expect(found_task[:type]).to be_a String
    expect(found_task[:attributes]).to be_a Hash
    expect(found_task[:attributes].keys).to eq([:project_id, :title, :description, :priority, :status])
    expect(found_task[:attributes][:project_id]).to be_an Integer
    expect(found_task[:attributes][:title]).to be_an String
    expect(found_task[:attributes][:description]).to be_an String
    expect(found_task[:attributes][:priority]).to be_an String
    expect(found_task[:attributes][:status]).to be_an String
  end
end