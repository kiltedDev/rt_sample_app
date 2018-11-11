FactoryBot.define do
  factory :user do
    name { "Bob Johansson" }
    email  { "thebob@bob.net" }
    password { "password" }
  end
end
