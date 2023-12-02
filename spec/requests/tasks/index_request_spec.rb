require "rails_helper"

describe "request all of a projects task information" do
  it "returns all tasks for a project" do
    user = User.create!(username: "User 1", email: "user1@email.com")
    project1 = user.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )
    task1 = project1.tasks.create!(title: "Task 1", description: "This is the first task", priority: 0)
    task2 = project1.tasks.create!(title: "Task 2", description: "This is the second task", priority: 0)

    get api_v1_user_project_tasks_path(user, project1)

    expect(response).to be_successful

    tasks = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(tasks).to be_an Array
    
    tasks.each do |task|
      expect(task.keys).to eq([:id, :type, :attributes])
      expect(task[:id]).to be_a String
      expect(task[:type]).to be_a String
      expect(task[:attributes]).to be_a Hash
      expect(task[:attributes].keys).to eq([:project_id, :title, :description, :priority, :status])
      expect(task[:attributes][:project_id]).to be_an Integer
      expect(task[:attributes][:title]).to be_an String
      expect(task[:attributes][:description]).to be_an String
      expect(task[:attributes][:priority]).to be_an String
      expect(task[:attributes][:status]).to be_an String
    end
  end
end