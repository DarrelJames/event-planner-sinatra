# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database
- [x] Include more than one model class (e.g. User, Post, Category)

Have User, Event, Venue, Guest models


- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts)

1. User has_many events
2. User has_many Guests through events,
3. Venue has_many events
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User)
1. Event belongs_to User
2. Event belongs_to Venue
3. Guest belongs_to Event

- [x] Include user accounts with unique login attribute (username or email)

validates_uniqueness_of :email

- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying
1. Events can CRUD
2. Guests can CRUD
- [x] Ensure that users can't modify content created by other users
Users are redirected to their homepage if they try to edit a page that's not theirs
- [x] Include user input validations
1. Can't create user without Email or Password
2. Can't Create Event with out event name

- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
Used sinatra-flash to create flash messages and display validation failures

- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
