class Recurrence < ActiveRecord::Base
  belongs_to :task

  attr_accessible :task_id, :expression, :starting_at, :next_at, :until_at

  delegate :user, to: :task

  scope :ready, -> { where('recurrences.next_at <= ?', Time.now) }
end
