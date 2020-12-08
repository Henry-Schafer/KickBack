class CreateEventRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :event_requests do |t|
      t.string :status
      t.integer :sender_id
      t.integer :owner_id

      t.timestamps
    end
  end
end
