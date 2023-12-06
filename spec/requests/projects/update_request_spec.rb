require "rails_helper"

describe "update a users projects" do
  it "updates an existing projects information" do
    user = User.create!(username: "User", email: "user@email.com")
    project1 = user.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )
    project = {
      "status": 1
    }
    patch api_v1_user_project_path(user, project1), params: project, as: :json

    expect(response).to be_successful

    updated_project = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(updated_project).to be_a Hash
    expect(updated_project.keys).to eq([:id, :type, :attributes, :relationships])
    expect(updated_project[:id]).to be_a String
    expect(updated_project[:type]).to be_a String
    expect(updated_project[:attributes]).to be_a Hash
    expect(updated_project[:attributes].keys).to eq([:user_id, :title, :description, :color, :status, :deadline])
    expect(updated_project[:attributes][:user_id]).to be_an Integer
    expect(updated_project[:attributes][:title]).to be_an String
    expect(updated_project[:attributes][:description]).to be_an String
    expect(updated_project[:attributes][:color]).to be_an String
    expect(updated_project[:attributes][:status]).to eq("in progress")
    expect(updated_project[:attributes][:deadline]).to be_an String
  end
end