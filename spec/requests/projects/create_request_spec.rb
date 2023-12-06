require "rails_helper"

describe "create a users projects" do
  it "returns the newly created projects information" do
    user = User.create!(username: "User", email: "user@email.com")
    project = {
      "title": "project 1",
      "description": "A New Project",
      "color": "123xyz",
      "deadline": "11/12/2023"
    }
    post api_v1_user_projects_path(user), params: project, as: :json

    expect(response).to be_successful

    new_project = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(new_project).to be_a Hash
    expect(new_project.keys).to eq([:id, :type, :attributes, :relationships])
    expect(new_project[:id]).to be_a String
    expect(new_project[:type]).to be_a String
    expect(new_project[:attributes]).to be_a Hash
    expect(new_project[:attributes].keys).to eq([:user_id, :title, :description, :color, :status, :deadline])
    expect(new_project[:attributes][:user_id]).to be_an Integer
    expect(new_project[:attributes][:title]).to be_an String
    expect(new_project[:attributes][:description]).to be_an String
    expect(new_project[:attributes][:color]).to be_an String
    expect(new_project[:attributes][:status]).to be_an String
    expect(new_project[:attributes][:deadline]).to be_an String
  end

  it "returns an error if all information isn't provided" do
    user = User.create!(username: "User", email: "user@email.com")
    project = {
      "description": "A New Project",
      "color": "123xyz",
      "deadline": "11/12/2023"
    }
    post api_v1_user_projects_path(user), params: project, as: :json

    expect(response).to be_successful

    message = JSON.parse(response.body, symbolize_names: true)

    expect(message).to be_a Hash
    expect(message.keys).to eq([:failure])
    expect(message[:failure]).to eq("Project Could Not Be Created")
  end
end