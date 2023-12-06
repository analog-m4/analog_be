require "rails_helper"

RSpec.describe "User Dashboard endpoint", type: :request do
    describe "GET /api/v1/users/:id/dashboard" do
        it "returns a user's dashboard" do
            user1 = User.create!(username: "User 1", email: "user1@email.com")
            project1 = Project.create!(title: "Project 1", description: "Project 1 description", color: "red", status: 0, deadline: "2021-01-01", user_id: user1.id)
            task1 = Task.create!(title: "Task 1", description: "Task 1 description", priority: 0, status: 0, project_id: project1.id)
            task2 = Task.create!(title: "Task 2", description: "Task 2 description", priority: 1, status: 1, project_id: project1.id)
            task3 = Task.create!(title: "Task 3", description: "Task 3 description", priority: 2, status: 2, project_id: project1.id)
            task4 = Task.create!(title: "Task 4", description: "Task 4 description", priority: 1, status: 1, project_id: project1.id)

            get "/api/v1/users/#{user1.id}/dashboard"

            json_response = JSON.parse(response.body, symbolize_names: true)
            # binding.pry
            expect(response).to be_successful
            expect(json_response[:data][:id]).to eq(user1.id.to_s)
            expect(json_response[:data][:type]).to eq("dashboard")
            expect(json_response[:data][:attributes][:username]).to eq(user1.username)
            expect(json_response[:data][:attributes][:email]).to eq(user1.email)
            expect(json_response[:data][:attributes][:projects].count).to eq(1)
            expect(json_response[:data][:attributes][:projects][0][:title]).to eq(project1.title)
            expect(json_response[:data][:attributes][:projects][0][:tasks].count).to eq(4)
            expect(json_response[:data][:attributes][:projects][0][:tasks][0][:title]).to eq(task1.title)
            expect(json_response[:data][:attributes][:projects][0][:tasks][1][:title]).to eq(task2.title)
            expect(json_response[:data][:attributes][:projects][0][:tasks][2][:title]).to eq(task3.title)
            expect(json_response[:data][:attributes][:projects][0][:tasks][3][:title]).to eq(task4.title)
        end
    end
end