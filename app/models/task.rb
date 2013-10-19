class Task < ActiveRecord::Base
  belongs_to :user
  has_one :recurrence

  attr_accessible :time_expression, :action, :description, :user_id

  validates :time_expression, :action, :user_id, presence: true
end

