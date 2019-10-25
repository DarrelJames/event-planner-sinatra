# Invitation.destroy_all
User.destroy_all
Event.destroy_all
Guest.destroy_all
Venue.destroy_all

Faq.destroy_all

user1 = User.create(email: "user1@email.com", password: "password")
user2 = User.create(email: "user2@email.com", password: "password")
user3 = User.create(email: "user3@email.com", password: "password")

User.all.each do |user|

  # event_per_user = Faker::Number.number(digits: 2).to_i

  puts "Adding #{event_per_user} events to user #{user.email}."

  5.times do
    venue = Venue.create(name: Faker::WorldCup.stadium, address: Faker::Address.street_name, city: Faker::Address.city, state: Faker::Address.state, zip_code: Faker::Address.zip)

    event = user.events.create(name: Faker::FunnyName.two_word_name, event_date: Faker::Date.forward(days: 23), venue: venue)

    guest_per_event = Faker::Number.number(digits: 2).to_i

    puts "Adding #{guest_per_event} guests to event #{event.name}."

    guest_per_event.times do
      event.guests.create(name: Faker::Name.unique.name, user: user)

    end
  end
end

puts "After seeding the database: "
puts "  - There are #{User.count} users."
puts "  - There are #{Event.count} events."
puts "  - There are #{Guest.count} guests."
puts "  - There are #{Venue.count} venues."











# event1 = user1.events.create(name: "User1 Event1", event_date: "10/10/10", start_time: "10", end_time: "12")
# event1.create_venue(name: "venue1", address: "san jose", city: "san jose", state: "ca", zip_code: "95132")
#
# event2 = user1.events.create(name: "User1 Event2", event_date: "10/10/10", start_time: "10", end_time: "12")
#
# event2.create_venue(name: "venue3", address: "san jose", city: "milpitas", state: "ca", zip_code: "95132")
#
# event3 = user2.events.create(name: "User2 Event1", event_date: "10/10/10", start_time: "10", end_time: "12")
# event3.create_venue(name: "venue4", address: "san jose", city: "fremont", state: "ca", zip_code: "95132")
#
# event4 = user2.events.create(name: "User2 Event2", event_date: "10/10/10", start_time: "10", end_time: "12")
# event4.create_venue(name: "venue2", address: "san jose", city: "san jose", state: "ca", zip_code: "95132")
#
# event5 = user3.events.create(name: "User3 Event1", event_date: "10/10/10", start_time: "10", end_time: "12")
# event5.create_venue(name: "venue1", address: "san jose", city: "san jose", state: "ca", zip_code: "95132")
#
# event6 = user3.events.create(name: "User3 Event2", event_date: "10/10/10", start_time: "10", end_time: "12")
# event6.create_venue(name: "venue1", address: "san jose", city: "san jose", state: "ca", zip_code: "95132")



# event1.faqs.create(question: "Where", answer: "san jose")
# event1.faqs.create(question: "when", answer: "tomorrow")
# event1.faqs.create(question: "why", answer: "why")
# event2.faqs.create(question: "Where", answer: "san jose")
# event2.faqs.create(question: "when", answer: "tomorrow")
# event2.faqs.create(question: "why", answer: "why")
