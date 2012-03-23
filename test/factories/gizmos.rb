# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :gizmo do
    name "MyString"
    description "MyText"
    price "9.99"
    enable false
  end
end
