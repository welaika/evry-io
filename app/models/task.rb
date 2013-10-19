class Task < ActiveRecord::Base
  belongs_to :user
  has_one :recurrence

  attr_accessible :time_expression, :action, :description

  validates :action, :user, presence: true
end

