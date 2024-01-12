require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe 'notification_email' do
    let(:user) { User.create(username: 'John', email: 'john@example.com') } 
    
    let(:project) { Project.create(title: 'Project Title', description: 'Project Description', color: 'blue', user: user) }
    
    let(:task) { Task.create(title: 'Task Title', description: 'Task Description', priority: 'low', project_id: project.id) }

    let(:mail) { UserMailer.notification_email(user, task) }

    it 'renders the headers' do
      expect(mail.subject).to eq('This task is due soon!')
      expect(mail.to).to eq([user.email])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to match("Hi #{user.username}")
      expect(mail.body.encoded).to match(task.title)
    end
  end
end
