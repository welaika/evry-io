class CreateTask < CreateRepository
  def after_create_hooks
    [ AddRecurrence ]
  end

  class AddRecurrence < Struct.new(:task)
    def perform

    end
  end
end
