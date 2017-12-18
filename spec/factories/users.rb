FactoryGirl.define do

  pass = Faker::Internet.password(min_length = 8)

  factory :user do
    name                  Faker::Name.name
    email                 Faker::Internet.email
    password pass
    password_confirmation pass
  end
end

# Faker::Internet.email ランダムなemail
# Faker::Name.name ランダムなname
# pass = Faker::Internet.password(min_length = 8) 最小で８文字のランダムなpassword
