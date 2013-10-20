class RecurrenceMailer < ActionMailer::Base
  default from: "mailer@evry.io"
  helper :tasks
  helper :recurrences
  helper :application

  def notify(user, task)
    @user = user
    @task = task
    mail(to: @user.email, subject: 'Evry.io notification')
  end
end

