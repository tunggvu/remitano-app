FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    password { "password" }
    password_confirmation { "password" }
  end
end
