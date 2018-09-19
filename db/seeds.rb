# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Set the locale, default is en-US
Faker::Config.locale = 'ja'

10.times do
  user_name = Faker::Name.name_with_middle
  user_email = Faker::Internet.email(user_name.split(' ')[0])
  user_pass = Faker::Internet.password(5, 20)

  User.create(
    name: user_name,
    email: user_email,
    password: user_pass,
    password_confirmation: user_pass
  )
end
