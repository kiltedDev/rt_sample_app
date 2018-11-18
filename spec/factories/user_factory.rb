FactoryBot.define do
  factory :user do
    name { "Bob Johansson" }
    email  { "thebob@bob.net" }
    password { "password" }
    activated { true }
    activated_at { Time.zone.now }
  end

  trait :major do
    name { "Ernesto Medeiros"}
    email { "E.Medeiros@brasil.gov"}
  end

  trait :butterworth do
    name { "Colonel Butterworth" }
    email  { "notbob@bob.net" }
    admin { true }
  end
end
