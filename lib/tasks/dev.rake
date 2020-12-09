desc "Hydrate the database with some sample data to look at so that developing is easier"
task({ :sample_data => :environment}) do
  require 'faker'

  User.destroy_all
  MyEvent.destroy_all
  Event.destroy_all
  EventRequest.destroy_all


5.times do |count|
    user = User.new
    user.email = Faker::Internet.email 
    user.username = Faker::Name.name 
    user.password = "password12345"
    user.save
 end

users = User.all
bool = [true, false]

 50.times do |count|
    event = Event.new
    event.event_name = Faker::Team.sport
    event.details = Faker::Address.community 
    event.public_status = bool.sample
    event.event_date = Faker::Date.forward(days: 23)
    event.creator_id = users.sample.id
    event.save
 end

 events= Event.all

 events.each do |event|
    my_event = MyEvent.new
    my_event.event_id = event.id
    my_event.user_id = event.creator_id 
    my_event.save 
 end

=begin
events.each do |event|
    my_event_request = EventRequest.new
    my_event_request.owner_id = users.sample.id
    my_event_request.sender_id = users.sample.id
    my_event_request.status = true

    matching_my_requests = EventRequest.where({ :sender_id => my_event_request.sender_id })
    my_request = matching_my_requests.at(0)
      if my_request == nil
        if my_event_request.owner_id != my_event_request.sender_id
          my_event_request.save 
        end
    end
end
=end

end