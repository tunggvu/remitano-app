FactoryBot.define do
  factory :movie do
    url { "MyString" }
    description { "MyString" }
    association :user
  end
end
