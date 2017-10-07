FactoryGirl.define do
  factory :user do
    username "testuser"
    sequence(:email){|n| "user#{n}@factory.com" }
    password "Testing"
    password_confirmation "Testing"
    confirmed_at Date.today
  end
end
