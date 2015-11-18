FactoryGirl.define do
  factory :user do
    email 'example@foobar.com'
    password 'password'
    password_confirmation 'password'
    created_at Time.now
    updated_at Time.now
  end
end
