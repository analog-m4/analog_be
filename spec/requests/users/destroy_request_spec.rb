require "rails_helper"

describe "delete a single user" do
  it "deletes the user" do
    user = User.create!(username: "User", email: "user@email.com")
  
    delete api_v1_user_path(user)

    expect(response).to be_successful

    message = JSON.parse(response.body, symbolize_names: true)

    expect(message).to be_a Hash
    expect(message.keys).to eq([:success])
    expect(message[:success]).to eq("User Deleted")
  end

  it "returns failure if the user could not be found" do
  
    delete api_v1_user_path(1)

    expect(response).to be_successful

    message = JSON.parse(response.body, symbolize_names: true)

    expect(message).to be_a Hash
    expect(message.keys).to eq([:failure])
    expect(message[:failure]).to eq("ID Not Found")
  end
end