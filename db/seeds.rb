# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'haikunator'

 $events = [
  'Saw you in the hallway',
  'You slammed the door',
  'I took a shower',
  'You started crying',
  'I was playing music loud',
  'You stormed out of the room',
  'I kept working on emacs',
  'I didn\'t say anything',
  'You went to bed early',
  'I went to bed early',
  'I went to bed really late',
  'You moved your stuff to the other room',
  'I was hanging out with my friend',
  'You were hanging out with your friend',
  'Your eye started twitching involuntarily'
]

$feelings = [
  'I felt really good',
  'I felt alright',
  'I felt bad',
  'I wanted to cry',
  'I was ecstatic',
  'I felt conflicting emotions',
  'I felt a bit of malaise',
  'It just made me really hungry'
]

def create_arguments_with_events_and_reactions(argument_count)
  argument_count.times do
    a = Argument.create!(name: Haikunator.haikunate(3))
    random_event_number = rand(1..10)
    random_event_indexes = (0..random_event_number-1).to_a.shuffle
    random_event_number.times do
      random_event_index = random_event_indexes.pop
      e = Event.create!({
        argument: a,
        body: $events.sample,
        position: random_event_index
      })
      random_feeling_number = rand(1..4)
      random_feeling_indexes = (0..random_feeling_number-1).to_a.shuffle
      random_feeling_number.times do
      random_feeling_index = random_feeling_indexes.pop
      Reaction.create!({position: random_feeling_index,
        body: $feelings.sample,
        user: [User.first, User.last].sample,
        event: e
        })
      end
    end
  end
end

create_arguments_with_events_and_reactions(3)

arguments = Argument.all
events = Event.all
reactions = Reaction.all

puts "Seed finished"
puts "#{arguments.count} arguments created"
puts "#{events.count} events created"
puts "#{reactions.count} reactions created"
