# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Ticket.delete_all
History.delete_all

vurkas = User.create({email: "vurkas@teiher.gr", password: "123qwe", password_confirmation: "123qwe", role: "admin"}, :as => :admin)
malu   = User.create({email: "malu@teiher.gr",  password: "123qwe",  password_confirmation: "123qwe", role: "tech"},  :as => :admin)
melina = User.create({email: "melina@teiher.gr",  password: "123qwe",  password_confirmation: "123qwe", role: "tech"},  :as => :admin)

manos  = User.create email: "manos@teiher.gr",  password: "123qwe",  password_confirmation: "123qwe"
nikos  = User.create email: "nikos@teiher.gr",  password: "123qwe",  password_confirmation: "123qwe"


10.times do |i|
  u = User.create email: "user#{i}@teiher.gr",  password: "123qwe",  password_confirmation: "123qwe"  
  rand(4).times do |j|
    t = u.create_ticket(name: "A ticket #{j} by user user#{i}", description: Faker::Lorem.paragraph(3))
    tech = [malu, melina,vurkas].shuffle.first
    t.assign_to(tech,vurkas) unless rand(10) > 7
  end
end