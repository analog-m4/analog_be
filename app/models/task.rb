class Task < ApplicationRecord
  validates_presence_of :title, :description, :priority
  enum priority: {
    "low" => 0,
    "medium" => 1,
    "high" => 2,
    "critical" => 3
  }
  enum status: {
    "backlog" => 0,
    "doing" => 1,
    "done" => 2,
  }
  belongs_to :project
end