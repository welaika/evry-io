# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :recurrence do
    task nil
    auto_schedule false
    next_at "2013-10-19 10:56:03"
    expression "MyString"
    starting_at "2013-10-19 10:56:03"
    until_at "2013-10-19 10:56:03"
  end
end
