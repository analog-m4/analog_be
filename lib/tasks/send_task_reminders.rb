namespace :task do
    desc "Send high-priority task reminders"
    task send_high_priority_task_reminders: :environment do
      due_tasks = Task.where("due_date <= ? AND priority = ?", Date.today, Task.priorities["high"])
      
      due_tasks.each do |task|
        UserMailer.with(user: task.user).notification_email(task).deliver_now
      end
    end
  
    desc "Send medium-priority task reminders"
    task send_medium_priority_task_reminders: :environment do
      due_tasks = Task.where("due_date <= ? AND priority = ?", Date.today, Task.priorities["medium"])
      
      due_tasks.each do |task|
        UserMailer.with(user: task.user).notification_email(task).deliver_now
      end
    end
  
    desc "Send low-priority task reminders"
    task send_low_priority_task_reminders: :environment do
      due_tasks = Task.where("due_date <= ? AND priority = ?", Date.today, Task.priorities["low"])
      
      due_tasks.each do |task|
        UserMailer.with(user: task.user).notification_email(task).deliver_now
      end
    end
  end
  