class Recurrence < ActiveRecord::Base
  belongs_to :task

  attr_accessible :task_id, :expression, :starting_at, :next_at, :until_at, :last_at

  delegate :user, to: :task

  scope :ready, -> { where('recurrences.next_at <= ?', Time.now) }

  def self.sync_with_task(task_id, attributes)
    Recurrence.where(task_id: task_id).first_or_create.tap do |r|
      r.update_attributes(attributes)
    end
  end
end
