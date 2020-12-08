desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  require 'faker'

  User.destroy_all
  MyEvent.destroy_all
  Event.destroy_all
  EventRequest.destroy_all


10.times do |count|
    user = User.new
    user.email = Faker::Internet.email 
    user.username = Faker::Name.name 
    user.password = "password12345"
    user.save
 end

users = User.all
bool = [true, false]

 20.times do |count|
    event = Event.new
    event.event_name = Faker::Team.sport 
    event.details = Faker::Marketing.buzzwords 
    event.public_status = bool.sample
    event.event_date = Faker::Date.forward(days: 23)
    event.creator_id = users.sample.id
    event.save 
 end

 events= Event.all

 10.times do |count|
    my_event = MyEvent.new
    my_event.event_id = events.sample.id
    my_event.user_id = users.sample.id 
    my_event.save 
 end

end
