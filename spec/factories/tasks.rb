# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :task do
    user nil
    title "MyString"
    description "MyText"
  end
end
