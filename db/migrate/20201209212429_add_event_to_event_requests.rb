class AddEventToEventRequests < ActiveRecord::Migration[6.0]
  def change
    add_column :event_requests, :the_event_id, :integer
  end
end
