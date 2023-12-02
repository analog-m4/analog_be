require "rails_helper"

describe "create a single user" do
  it "returns the users information" do
    user = {
      "username": "First User",
      "email": "first_user@email.com"
    }
    post api_v1_users_path, params: user, as: :json

    expect(response).to be_successful

    found_user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(found_user).to be_a Hash
    expect(found_user.keys).to eq([:id, :type, :attributes])
    expect(found_user[:id]).to be_a String
    expect(found_user[:type]).to be_a String
    expect(found_user[:attributes]).to be_a Hash
    expect(found_user[:attributes].keys).to eq([:username, :email])
    expect(found_user[:attributes][:username]).to eq("First User")
    expect(found_user[:attributes][:email]).to eq("first_user@email.com")
  end

  it "returns an error if all information isn't provided" do
    user = {
      "email": "first_user@email.com"
    }
    post api_v1_users_path, params: user, as: :json

    expect(response).to be_successful

    message = JSON.parse(response.body, symbolize_names: true)

    expect(message).to be_a Hash
    expect(message.keys).to eq([:failure])
    expect(message[:failure]).to eq("User Could Not Be Created")
  end
end