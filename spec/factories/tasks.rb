FactoryGirl.define do
  factory :task do
    user
    action "code hard"
    time_expression "every day"
    description "Coding hard is fun!"
  end
end
