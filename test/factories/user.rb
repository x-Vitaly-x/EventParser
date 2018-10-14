FactoryGirl.define do
  factory :user do
    email {Faker::Internet.safe_email('test_user')}
    password Faker::Internet.password
  end
end
