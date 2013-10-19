FactoryGirl.define do
  factory :recurrence do
    task
    auto_schedule false
    expression "day"
    next_at "2013-10-19 10:56:03"
    starting_at "2013-10-19 10:56:03"
    until_at "2013-10-21 10:56:03"
  end
end
