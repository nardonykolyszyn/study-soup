# frozen_string_literal: true

require 'faker'

user = User.new(first_name: 'Test', last_name: 'User', username: 'testing', email: 'test@mail.com', password: '123456')
user.save!

# Object freezing is not needed for symbols.
tags = %i[football programming couples instagram food friday dance travel sunshine newyork socialnetwork]

20.times do
  link = user.links.create(url: Faker::Internet.unique.url)
  link.tags.build(name: tags.sample)
  link.save!
end
