class Recurrence < ActiveRecord::Base
  belongs_to :task

  attr_accessible :task_id, :expression, :starting_at, :next_at, :until_at
end
