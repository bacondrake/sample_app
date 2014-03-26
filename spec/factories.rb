FactoryGirl.define do
  factory :user do
    name     "Frank Pavey"
    email    "frank.pavey@example.com"
    password "foobar"
    password_confirmation "foobar"
  end
end