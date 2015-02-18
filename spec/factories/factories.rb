FactoryGirl.define do
  factory :user do
    sequence(:email, 1000) { |n| "john#{n}@snarf.com" }
  end

  factory :media_item do
    sequence(:title, 1000) { |n| "media-item{n}" }
    description { "blah blah blah" }
    user
    source { "link to source" }
  end
end
