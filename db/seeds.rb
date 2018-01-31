# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



argument = Argument.create!(
  {
    name: 'Keep bumping into each other'
  }
)

event1 = Event.create!(
  {
    argument: argument,
    body: 'We were both up late studying',
    position: 0
  }
)

Reaction.create!(
  {
    event: event1,
    position: 0,
    body: 'Really offended that you weren\'t looking where you were going',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 1,
    body: 'Felt good too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 2,
    body: 'Felt bad too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 3,
    body: 'Some malaise perhaps.',
    user: User.first
  }
)

event1 = Event.create!(
  {
    argument: argument,
    body: 'I tripped over your shoes strewn around the living room.',
    position: 0
  }
)

Reaction.create!(
  {
    event: event1,
    position: 0,
    body: 'Really offended that you weren\'t looking where you were going',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 1,
    body: 'Felt good too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 2,
    body: 'Felt bad too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 3,
    body: 'Some malaise perhaps.',
    user: User.first
  }
)


event1 = Event.create!(
  {
    argument: argument,
    body: 'I tripped over your shoes strewn around the living room.',
    position: 0
  }
)

Reaction.create!(
  {
    event: event1,
    position: 0,
    body: 'Really offended that you weren\'t looking where you were going',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 1,
    body: 'Felt good too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 2,
    body: 'Felt bad too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 3,
    body: 'Some malaise perhaps.',
    user: User.first
  }
)



event1 = Event.create!(
  {
    argument: argument,
    body: 'Already were pressured by deadlines',
    position: 0
  }
)

Reaction.create!(
  {
    event: event1,
    position: 0,
    body: 'Really offended that you weren\'t looking where you were going',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 1,
    body: 'Felt good too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 2,
    body: 'Felt bad too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 3,
    body: 'Some malaise perhaps.',
    user: User.first
  }
)

event1 = Event.create!(
  {
    argument: argument,
    body: 'Threw your back out',
    position: 0
  }
)

Reaction.create!(
  {
    event: event1,
    position: 0,
    body: 'Really offended that you weren\'t looking where you were going',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 1,
    body: 'Felt good too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 2,
    body: 'Felt bad too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 3,
    body: 'Some malaise perhaps.',
    user: User.first
  }
)


argument = Argument.create!(
  {
    name: 'Taking too long in the bathroom'
  }
)

event1 = Event.create!(
  {
    argument: argument,
    body: 'Really had to go and was waiting outside',
    position: 0
  }
)

Reaction.create!(
  {
    event: event1,
    position: 0,
    body: 'Felt powerless.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 1,
    body: 'Felt good too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 2,
    body: 'Felt bad too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 3,
    body: 'Some malaise perhaps.',
    user: User.first
  }
)


argument = Argument.create!(
  {
    name: 'Leaving the house dirty'
  }
)

event1 = Event.create!(
  {
    argument: argument,
    body: 'I tripped over your shoes strewn around the living room.',
    position: 0
  }
)

Reaction.create!(
  {
    event: event1,
    position: 0,
    body: 'Really offended that you weren\'t looking where you were going',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 1,
    body: 'Felt good too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 2,
    body: 'Felt bad too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 3,
    body: 'Some malaise perhaps.',
    user: User.first
  }
)

event1 = Event.create!(
  {
    argument: argument,
    body: 'I tripped over your shoes strewn around the living room.',
    position: 0
  }
)

Reaction.create!(
  {
    event: event1,
    position: 0,
    body: 'Really offended that you weren\'t looking where you were going',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 1,
    body: 'Felt good too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 2,
    body: 'Felt bad too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 3,
    body: 'Some malaise perhaps.',
    user: User.first
  }
)

event1 = Event.create!(
  {
    argument: argument,
    body: 'I tripped over your shoes strewn around the living room.',
    position: 0
  }
)

Reaction.create!(
  {
    event: event1,
    position: 0,
    body: 'Really offended that you weren\'t looking where you were going',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 1,
    body: 'Felt good too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 2,
    body: 'Felt bad too.',
    user: User.first
  }
)

Reaction.create!(
  {
    event: event1,
    position: 3,
    body: 'Some malaise perhaps.',
    user: User.first
  }
)
