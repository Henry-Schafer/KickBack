# == Schema Information
#
# Table name: event_requests
#
#  id         :integer          not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#  sender_id  :integer
#
class EventRequest < ApplicationRecord
  belongs_to(:sender, { :required => false, :class_name => "User", :foreign_key => "sender_id" })
  belongs_to(:owner, { :required => false, :class_name => "User", :foreign_key => "owner_id" })
end
