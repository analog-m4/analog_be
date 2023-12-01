class User < ApplicationRecord
  validates_presence_of :username
  validates :email, uniqueness: :true, presence: :true
  has_many :projects
  has_many :tasks, through: :projects
end