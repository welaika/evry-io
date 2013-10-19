class CreateTask < CreateRepository
  def after_create_hooks
    [ SyncTaskRecurrence ]
  end
end

