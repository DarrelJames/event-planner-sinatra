user1 = User.create(email: "user1@email.com", password: "password")
user2 = User.create(email: "user2@email.com", password: "password")
user3 = User.create(email: "user3@email.com", password: "password")

event1 = user1.events.create(name: "User1 Event1", event_date: "10/10/10", start_time: "10", end_time: "12")
event1.create_venue(name: "venue1", address: "san jose", city: "san jose", state: "ca", zip_code: "95132")

event2 = user1.events.create(name: "User1 Event2", event_date: "10/10/10", start_time: "10", end_time: "12")
event2.create_venue(name: "venue3", address: "san jose", city: "milpitas", state: "ca", zip_code: "95132")

event3 = user2.events.create(name: "User2 Event1", event_date: "10/10/10", start_time: "10", end_time: "12")
event3.create_venue(name: "venue4", address: "san jose", city: "fremont", state: "ca", zip_code: "95132")

event4 = user2.events.create(name: "User2 Event2", event_date: "10/10/10", start_time: "10", end_time: "12")
event4.create_venue(name: "venue2", address: "san jose", city: "san jose", state: "ca", zip_code: "95132")

event5 = user3.events.create(name: "User3 Event1", event_date: "10/10/10", start_time: "10", end_time: "12")
event5.create_venue(name: "venue1", address: "san jose", city: "san jose", state: "ca", zip_code: "95132")

event6 = user3.events.create(name: "User3 Event2", event_date: "10/10/10", start_time: "10", end_time: "12")
event6.create_venue(name: "venue1", address: "san jose", city: "san jose", state: "ca", zip_code: "95132")



event1.faqs.create(question: "Where", answer: "san jose")
event1.faqs.create(question: "when", answer: "tomorrow")
event1.faqs.create(question: "why", answer: "why")
event2.faqs.create(question: "Where", answer: "san jose")
event2.faqs.create(question: "when", answer: "tomorrow")
event2.faqs.create(question: "why", answer: "why")
