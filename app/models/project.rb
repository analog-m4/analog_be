class Project < ApplicationRecord
  validates_presence_of :title, :description, :color, :deadline
  enum status: {
    "assigned" => 0,
    "in progress" => 1,
    "pending review" => 2,
    "completed" => 3
  }
  belongs_to :user
  has_many :tasks
end