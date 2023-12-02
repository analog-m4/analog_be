require "rails_helper"

describe "delete a single task" do
  it "deletes the tsak" do
    user = User.create!(username: "User", email: "user@email.com")
    project1 = user.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )
    task1 = project1.tasks.create!(title: "Task 1", description: "This is the first task", priority: 0)
    
    delete api_v1_user_project_task_path(user, project1, task1)
    
    expect(response).to be_successful
    
    message = JSON.parse(response.body, symbolize_names: true)
    
    expect(message).to be_a Hash
    expect(message.keys).to eq([:success])
    expect(message[:success]).to eq("Task Deleted")
  end
  
  it "returns failure if the project could not be found" do
    user = User.create!(username: "User", email: "user@email.com")
    project1 = user.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )
  
    delete api_v1_user_project_task_path(user, project1, 1)

    expect(response).to be_successful

    message = JSON.parse(response.body, symbolize_names: true)

    expect(message).to be_a Hash
    expect(message.keys).to eq([:failure])
    expect(message[:failure]).to eq("ID Not Found")
  end
end