# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

beach_house = House.create(address: "Ocean Beach")
city_house = House.create(address: "Dolores Street")

richard = Person.create(name: "Richard", house_id: beach_house.id )
rob = Person.create(name: "Rob", house_id: city_house.id)
alex = Person.create(name: "Alex", house_id: city_house.id)