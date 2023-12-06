require "rails_helper"

describe "request all of a users project information" do
  it "returns all projects for a user" do
    user = User.create!(username: "User 1", email: "user1@email.com")
    project1 = user.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )
    project2 = user.projects.create!(title: "Project 2", description: "This is the second project", color: "456abc", deadline: "24/12/2023" )

    get api_v1_user_projects_path(user)

    expect(response).to be_successful

    projects = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(projects).to be_an Array
    
    projects.each do |project|
      expect(project.keys).to eq([:id, :type, :attributes, :relationships])
      expect(project[:id]).to be_a String
      expect(project[:type]).to be_a String
      expect(project[:attributes]).to be_a Hash
      expect(project[:attributes].keys).to eq([:user_id, :title, :description, :color, :status, :deadline])
      expect(project[:attributes][:user_id]).to be_an Integer
      expect(project[:attributes][:title]).to be_an String
      expect(project[:attributes][:description]).to be_an String
      expect(project[:attributes][:color]).to be_an String
      expect(project[:attributes][:status]).to be_an String
      expect(project[:attributes][:deadline]).to be_an String
    end
  end
end