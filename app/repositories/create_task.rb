class CreateTask < CreateRepository
  def after_create_hooks
    [ AddRecurrence ]
  end
end

class AddRecurrence < Struct.new(:task)
  def perform
    if result = Tickle.parse(task.time_expression)
      Recurrence.create(
        task_id: task.id,
        expression: result.expression,
        starting_at: result.starting,
        next_at: result.next,
        until_at: result.until
      )
    else
      task.errors.add :time_expression,
        I18n.t('activerecord.errors.models.task.attributes.time_expression.parse_failed')
    end
  end
end
