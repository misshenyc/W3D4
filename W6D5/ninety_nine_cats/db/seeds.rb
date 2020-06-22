# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.destroy_all 

bee = Cat.create!(birth_date: "2015/01/20", color: "golden", name: "bee", sex: "F", description: 'good girl')
gordo = Cat.create!(birth_date: "2016/05/25", color: "grey", name: "gordon", sex: "M", description: 'good boy')
garfield = Cat.create!(birth_date: "2010/01/20", color: "orange", name: "garfield", sex: "M",description: 'bad boy')