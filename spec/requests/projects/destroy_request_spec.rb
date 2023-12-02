require "rails_helper"

describe "delete a single project" do
  it "deletes the project" do
    user = User.create!(username: "User", email: "user@email.com")
    project1 = user.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )
    
    delete api_v1_user_project_path(user, project1)
    
    expect(response).to be_successful
    
    message = JSON.parse(response.body, symbolize_names: true)
    
    expect(message).to be_a Hash
    expect(message.keys).to eq([:success])
    expect(message[:success]).to eq("Project Deleted")
  end
  
  it "returns failure if the project could not be found" do
    user = User.create!(username: "User", email: "user@email.com")
  
    delete api_v1_user_project_path(user, 1)

    expect(response).to be_successful

    message = JSON.parse(response.body, symbolize_names: true)

    expect(message).to be_a Hash
    expect(message.keys).to eq([:failure])
    expect(message[:failure]).to eq("ID Not Found")
  end
end