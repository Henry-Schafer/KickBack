desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  require 'faker'

  User.destroy_all
  MyEvent.destroy_all
  Event.destroy_all
  EventRequest.destroy_all


15.times do |count|
    user = User.new
    user.email = Faker::Internet.email 
    user.username = Faker::Name.unique.name 
    user.password = "password12345"
    user.save
 end

 bool = [true, false]

 40.times do |count|
    event = Event.new
    event.event_name = Faker::Name.first_name 
    event.details = Faker::Quotes::Shakespeare.romeo_and_juliet_quote 
    event.public_status = bool.sample
    event.event_date = Faker::Date.forward(days: 23)
    event.creator_id = rand(1..15)
    event.save 
 end

end
