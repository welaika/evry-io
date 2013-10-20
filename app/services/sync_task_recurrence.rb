class SyncTaskRecurrence < Struct.new(:task)
  def user
    task.user
  end

  def perform
    if result = Tickle.parse(task.time_expression)
      result = OpenStruct.new(result)

      Recurrence.sync_with_task(task.id, {
        expression: result.expression,
        starting_at: moment_with_timezone(result.starting),
        next_at: moment_with_timezone(result.next),
        until_at: moment_with_timezone(result.until)
      })
    else
      task.destroy
      task.errors.add :time_expression,
        I18n.t('activerecord.errors.models.task.attributes.time_expression.parse_failed')
    end
  end

  def moment_with_timezone(moment)
    TimeZoneConverter.convert(moment, user)
  end
end

