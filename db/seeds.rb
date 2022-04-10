# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

4.times do |i|
  event = Event.create!(
    name: "event#{i + 1}", 
    start: DateTime.parse("2022-04-#{i + 1} 10:00"),
    end: DateTime.parse("2022-04-#{i + 1} 11:00"),
    memo: "#{i + 1}つ目のイベント",
    color: nil,
  )
  p "#{event.name}を作成しました"
end