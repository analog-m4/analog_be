require "rails_helper"

describe "request a single projects information" do
  it "returns the projects information" do
    user = User.create!(username: "User", email: "user@email.com")
    project = user.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )

    get api_v1_user_project_path(user, project)

    expect(response).to be_successful

    found_project = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(found_project).to be_a Hash
    expect(found_project.keys).to eq([:id, :type, :attributes, :relationships])
    expect(found_project[:id]).to be_a String
    expect(found_project[:type]).to be_a String
    expect(found_project[:attributes]).to be_a Hash
    expect(found_project[:attributes].keys).to eq([:user_id, :title, :description, :color, :status, :deadline])
    expect(found_project[:attributes][:user_id]).to be_an Integer
    expect(found_project[:attributes][:title]).to be_an String
    expect(found_project[:attributes][:description]).to be_an String
    expect(found_project[:attributes][:color]).to be_an String
    expect(found_project[:attributes][:status]).to be_an String
    expect(found_project[:attributes][:deadline]).to be_an String
  end
end