FactoryGirl.define do
  factory :user do
    sequence(:email, 1000) { |n| "john#{n}@snarf.com" }
  end

  factory :media_item do
    title { "media-item" }
    description { "blah blah blah" }
    source { "link to source" }
    user
  end
end
