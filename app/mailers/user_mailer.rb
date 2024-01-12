class UserMailer < ApplicationMailer
  def notification_email(user, task)
    @user = user
    @task = task
    mail(to: @user.email, subject: 'This task is due soon!')
  end
end
