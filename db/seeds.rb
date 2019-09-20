# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!( name: 'carlos',
              email: 'thiesemail@email.com',
              password: 'foobar',
              password_confirmation: 'foobar')

User.create!( name: 'antonio',
              email: 'thiisemail@email.com',
              password: 'foobar',
              password_confirmation: 'foobar')

User.create!( name: 'angie',
              email: 'thisisother@email.com',
              password: 'foobar',
              password_confirmation: 'foobar')

              

user = User.find_by(name: "carlos")
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now}", date: Time.now)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now - 1.day}", date: Time.now - 1.day)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now + 1.day}", date: Time.now + 1.day)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now - 1.month}", date: Time.now - 1.month)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now + 1.month}", date: Time.now + 1.month)
event.save()

user = User.find_by(name: "antonio")
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now}", date: Time.now)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now - 1.day}", date: Time.now - 1.day)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now + 1.day}", date: Time.now + 1.day)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now - 1.month}", date: Time.now - 1.month)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now + 1.month}", date: Time.now + 1.month)
event.save()

user = User.find_by(name: "angie")
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now}", date: Time.now)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now - 1.day}", date: Time.now - 1.day)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now + 1.day}", date: Time.now + 1.day)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now - 1.month}", date: Time.now - 1.month)
event.save()
event = user.events.build(title: "Parranda", description: "This is the parranda #{Time.now + 1.month}", date: Time.now + 1.month)
event.save()

# Attend to one event
carlos = User.find_by(name: "carlos")
angie = User.find_by(name: "angie")
antonio = User.find_by(name: "antonio")

event = carlos.events.first
carlos.events_as_attendee << event
angie.events_as_attendee << event
antonio.events_as_attendee << event
