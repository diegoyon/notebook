# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Topic.create!([{name: 'Music', icon: '🎶' }, {name: 'Sports', icon: '🏈'}, {name: 'Travel', icon: '🌎'}, {name: 'Studies', icon: '📚'}, {name: 'Food', icon: '🍕'}, {name: 'Cars', icon: '🚘'}, {name: 'Movies', icon: '🎞️'}, {name: 'Personal', icon: '✍🏽'}, {name: 'Games', icon: '🎲'}])

3.times do
  random_date = Time.zone.now - rand(1..10).day
  Note.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph_by_chars, topic_id: rand(1..9), created_at: random_date, updated_at: random_date)
end
