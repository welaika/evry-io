module TasksHelper
  def task_summary(task)
    result = []
    result << task.time_expression
    result << content_tag(:em) { "I want to" }
    result << task.action
    result.join(" ").capitalize.html_safe
  end
end
