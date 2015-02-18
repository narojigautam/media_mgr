FactoryGirl.define do
  factory :user do
    sequence(:email, 1000) { |n| "john#{n}@snarf.com" }
  end
end
