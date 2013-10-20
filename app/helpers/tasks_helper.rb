module TasksHelper
  def task_summary(task)
    result = [
      task.time_expression,
      "I want to",
      task.action
    ].join(" ")
    truncate(result, length: 50)
  end

  def task_scheduled_class(task)
    'not-scheduled' unless task.recurrence.try(:next_at)
  end

end
