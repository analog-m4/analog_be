require "rails_helper"

describe "request a single users information" do
  it "returns the users information" do
    user = User.create!(username: "User", email: "user@email.com")

    get "/api/v1/users/#{user.id}"

    expect(response).to be_successful

    found_user = JSON.parse(response.body, symbolize_names: true)[:data]

    expect(found_user).to be_a Hash
    expect(found_user.keys).to eq([:id, :type, :attributes])
    expect(found_user[:id]).to be_a String
    expect(found_user[:type]).to be_a String
    expect(found_user[:attributes]).to be_a Hash
    expect(found_user[:attributes].keys).to eq([:username, :email])
    expect(found_user[:attributes][:username]).to be_an String
    expect(found_user[:attributes][:email]).to be_an String
  end

  it "returns an error when trying to find a user that does not exist" do
    get "/api/v1/users/999999999"

    expect(response.status).to eq(404)

    result = JSON.parse(response.body, symbolize_names: true)

    expect(result[:error]).to eq("Couldn't find User with 'id'=999999999")
  end
end