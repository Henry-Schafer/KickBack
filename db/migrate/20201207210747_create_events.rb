class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.text :details
      t.boolean :public_status
      t.string :event_name
      t.integer :creator_id
      t.date :event_date

      t.timestamps
    end
  end
end
