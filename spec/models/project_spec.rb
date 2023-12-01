require "rails_helper"

RSpec.describe Project, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:deadline) }
    it { should belong_to(:user) }
    it { should have_many(:tasks) }
  end
end