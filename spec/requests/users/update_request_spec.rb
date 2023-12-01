require "rails_helper"

describe "update a single user" do
  it "updates the information for a user" do
    first = User.create!(username: "User", email: "user@email.com")
    user = {
      "username": "First User"
    }
    patch api_v1_user_path(first), params: user, as: :json

    expect(response).to be_successful

    found_user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(found_user).to be_a Hash
    expect(found_user.keys).to eq([:id, :type, :attributes])
    expect(found_user[:id]).to be_a String
    expect(found_user[:type]).to be_a String
    expect(found_user[:attributes]).to be_a Hash
    expect(found_user[:attributes].keys).to eq([:id, :username, :email])
    expect(found_user[:attributes][:id]).to be_an Integer
    expect(found_user[:attributes][:username]).to eq("First User")
    expect(found_user[:attributes][:email]).to eq("user@email.com")
  end
end