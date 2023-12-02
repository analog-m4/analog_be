require "rails_helper"

describe "request all users information" do
  it "returns all users information" do
    user1 = User.create!(username: "User 1", email: "user1@email.com")
    user2 = User.create!(username: "User 2", email: "user2@email.com")
    user3 = User.create!(username: "User 3", email: "user3@email.com")

    get api_v1_users_path

    expect(response).to be_successful

    users = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(users).to be_an Array
    
    users.each do |user|
      expect(user.keys).to eq([:id, :type, :attributes])
      expect(user[:id]).to be_a String
      expect(user[:type]).to be_a String
      expect(user[:attributes]).to be_a Hash
      expect(user[:attributes].keys).to eq([:id, :username, :email])
      expect(user[:attributes][:id]).to be_an Integer
      expect(user[:attributes][:username]).to be_an String
      expect(user[:attributes][:email]).to be_an String
    end
  end
end