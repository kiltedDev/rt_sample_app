FactoryBot.define do
  factory :user do
    name { "Bob Johansson" }
    email  { "thebob@bob.net" }
    password { "password" }
  end

  trait :major do
    name { "Ernesto Medeiros"}
    email { "E.Medeiros@brasil.gov"}
  end

  trait :butterworth do
    name { "Colnel Butterworth" }
    email  { "notbob@bob.net" }
    admin { true }
  end
end
