class HandleRecurrences
  def self.perform
    new.perform
  end

  def recurrences
    Recurrence.ready
  end

  def perform
    recurrences.each do |recurrence|
      handle_recurrence(recurrence)
    end
  end

  def handle_recurrence(recurrence)
    recurrence_hooks.each do |hook|
      send(hook, recurrence)
    end
  end

  def recurrence_hooks
    [ :send_mail_notification, :reset_next_at ]
  end

  def send_mail_notification(recurrence)
    RecurrenceMailer.notify(recurrence.user, recurrence.task).deliver
  end

  def reset_next_at(recurrence)
    recurrence.update_attributes(next_at: nil)
  end

end

