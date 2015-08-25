# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

[
    {
        complete: true,
        name: "Learn Rails"
    },
    {
        complete: false,
        name: "Learn Football"
    },
    {
        complete: true,
        name: "Learn Gym"
    },
    {
        complete: true,
        name: "Learn Swimming"
    },
    {
        complete: false,
        name: "Learn Piano"
    },
    {
        complete: true,
        name: "Learn Math"
    },
    {
        complete: true,
        name: "Learn Ruby"
    },
].each do |task|
  Task.create(name: task[:name], complete: task[:complete])
end