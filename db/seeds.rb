# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user1 = User.create!(username: "Test User 1", email: "user1@test.com")
user2 = User.create!(username: "Test User 2", email: "user2@test.com")
user3 = User.create!(username: "Test User 3", email: "user3@test.com")
project1 = user1.projects.create!(title: "Project 1", description: "This is the first project", color: "123xyz", deadline: "12/12/2023" )
project2 = user1.projects.create!(title: "Project 2", description: "This is the second project", color: "456abc", deadline: "24/11/2023" )
project3 = user2.projects.create!(title: "Project 3", description: "This is the third project", color: "123xyz", deadline: "13/10/2023" )
project4 = user2.projects.create!(title: "Project 4", description: "This is the fourth project", color: "456abc", deadline: "25/09/2023" )
project5 = user3.projects.create!(title: "Project 5", description: "This is the fifth project", color: "123xyz", deadline: "14/08/2023" )
project6 = user3.projects.create!(title: "Project 6", description: "This is the sixth project", color: "456abc", deadline: "26/07/2023" )
task1 = project1.tasks.create!(title: "Task 1", description: "This is the first task", priority: 0)
task2 = project1.tasks.create!(title: "Task 2", description: "This is the second task", priority: 1, status: 1)
task3 = project2.tasks.create!(title: "Task 3", description: "This is the third task", priority: 2)
task4 = project2.tasks.create!(title: "Task 4", description: "This is the fourth task", priority: 3, status: 2)
task5 = project3.tasks.create!(title: "Task 5", description: "This is the fifth task", priority: 0)
task6 = project3.tasks.create!(title: "Task 6", description: "This is the sixth task", priority: 1, status: 1)
task7 = project4.tasks.create!(title: "Task 7", description: "This is the seventh task", priority: 2)
task8 = project4.tasks.create!(title: "Task 8", description: "This is the eighth task", priority: 3, status: 2)
task9 = project5.tasks.create!(title: "Task 9", description: "This is the ninth task", priority: 0)
task10 = project5.tasks.create!(title: "Task 10", description: "This is the tenth task", priority: 1, status: 1)
task11 = project6.tasks.create!(title: "Task 11", description: "This is the eleventh task", priority: 2)
task12 = project6.tasks.create!(title: "Task 12", description: "This is the twelth task", priority: 3, status: 2)
