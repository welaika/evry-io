class Task < ActiveRecord::Base
  belongs_to :user
  has_one :recurrence

  attr_accessible :time_expression, :action, :description, :user_id

  validates :action, :user, presence: true
end

