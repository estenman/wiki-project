FactoryGirl.define do
  factory :user do
    username "testuser"
    sequence(:email){|n| "user#{n}@factory.com" }
    encrypted_password "Testing"
    ##is this confirmation needed?
    password_confirmation "Testing"
  end
end
