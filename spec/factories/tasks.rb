FactoryGirl.define do
  factory :task do
    user
    action "code hard"
    time_expression "every day"
  end
end

