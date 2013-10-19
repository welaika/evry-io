class UpdateTask < Struct.new(:task)
  def perform(attributes)
    if task.update_attributes(attributes)
      SyncTaskRecurrence.new(task).perform
    end
  end
end

