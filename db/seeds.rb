# frozen_string_literal: true

require 'faker'

user = User.new(first_name: 'Test', last_name: 'User', username: 'testing', email: 'test@mail.com', password: '123456')
user.save!

# Object freezing is not needed for symbols.
tags = %i[football programming couples instagram food friday dance travel sunshine newyork socialnetwork]

100.times do
  link = Link.create(url: Faker::Internet.unique.url)
  link.tags.build(name: tags.sample)
  link.save!
end


Link.all.each do |link|
  user.links << link
end
