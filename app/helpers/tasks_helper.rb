module TasksHelper
  def task_summary(task)
    result = [
      task.time_expression,
      "I want to",
      task.action
    ].join(" ").capitalize
    truncate(result, length: 50)
  end

end
