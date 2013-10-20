class SyncTaskRecurrence < Struct.new(:task)
  def perform
    if result = Tickle.parse(task.time_expression)
      result = OpenStruct.new(result)

      Recurrence.sync_with_task(task.id, {
        expression: result.expression,
        starting_at: result.starting,
        next_at: result.next,
        until_at: result.until
      })
    else
      task.destroy
      task.errors.add :time_expression,
        I18n.t('activerecord.errors.models.task.attributes.time_expression.parse_failed')
    end
  end
end

