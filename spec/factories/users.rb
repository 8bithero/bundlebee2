# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    name 'Test User'
    email 'example@example.com'
    password 'please'
    password_confirmation 'please'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end

  factory :developer do
    name 'Developer User'
    email 'dev@foo.com'
    password 'foobar'
    password_confirmation 'foobar'
    # required if the Devise Confirmable module is used
    # confirmed_at Time.now
  end
end