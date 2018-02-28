# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "cleaning dB"

Message.destroy_all
Colevent.destroy_all
Collaborator.destroy_all
Event.destroy_all
User.destroy_all

puts "creating users"

users_attributes = [
{ email: 'rh@lewagon.org', password: 'Clane12', company: 'Le Wagon',
  photo: "https://i.pinimg.com/236x/a5/2c/5a/a52c5a6ff5bbc2b165e805ff30c424ad.jpg"},
{ email: 'rh@total.com', password: 'Clane12', company: 'Total',

photo: "http://www.tv83.info/wp-content/uploads/2015/05/total.jpg"},
{ email: 'admin@mcclane.fr', password: 'Clane42', company: 'McClane',
  photo: "http://www.mcclane.tech/assets/logo-b7379b39556678c71a83919d7b7bd16aeca78d5e5fc6651f3255c92ad47dd6c0.png", admin: true}]

users = User.create!(users_attributes)

puts "creating collaborators"

collaborators_attributes = [
{ email: 'nassim@gmail.com', phone_pro: '0610257263', first_name: "Nassim",
last_name: "Mezouar", continent:"Europe", country: "France", city: "Paris", user_id: User.first.id},
{ email: 'dante@gmail.com', phone_pro: '0634264547', first_name: "Dante",
last_name: "Planterose", continent:"Africa", country: "Senegal", city: "Dakar", user_id: User.first.id},
{ email: 'thibaud@gmail.com', phone_pro: '0786091509', first_name: "Thibaud",
last_name: "Vuitton", continent:"Europe", country: "France", city: "Lyon", user_id: User.first.id},
{ email: 'maximilien@gmail.com', phone_pro: '0681256797', first_name: "Maxmilien",
last_name: "Rufin", continent:"Europe", country: "France", city: "Paris", user_id: User.first.id},
{ email: 'thomas@gmail.com', phone_pro: '0681257797', first_name: "Thomas",
last_name: "Sertorio", continent:"Europe", country: "France", city: "Paris", user_id: User.last.id}
]

collaborators = Collaborator.create!(collaborators_attributes)

puts "creating events"

events_attributes = [
{ name: "Tsunami", user: User.first },
{ name: "Attaque HQ", end_date: "12/12/2017", user: User.first } ]

events = Event.create!(events_attributes)

puts "creating colevent"

  collabos = Collaborator.joins(:user).where(users: {company: 'Le Wagon'}, collaborators: {country: "France"} )
  collabos.each do |collabo|
   Colevent.create(event: Event.find_by(name: "Tsunami"), collaborator: collabo, safe: false)
  end

 puts "OK done!"
