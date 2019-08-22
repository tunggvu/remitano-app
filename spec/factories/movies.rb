FactoryBot.define do
  factory :movie do
    url { 'https://www.youtube.com/watch?v=yLuLsNcZq_A' }
    association :user
  end
end
