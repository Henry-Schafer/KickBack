# == Schema Information
#
# Table name: events
#
#  id            :integer          not null, primary key
#  details       :text
#  event_date    :date
#  event_name    :string
#  public_status :boolean
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  creator_id    :integer
#
class Event < ApplicationRecord
  belongs_to(:creator, { :required => false, :class_name => "User", :foreign_key => "creator_id" })
  has_many(:my_events, { :class_name => "MyEvent", :foreign_key => "event_id", :dependent => :destroy })
  
end
