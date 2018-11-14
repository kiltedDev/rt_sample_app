FactoryBot.define do
  factory :micropost do
    content { Faker::Lorem.sentence }
  end
end
