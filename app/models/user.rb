# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string
#  password_digest :string
#  username        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_many(:events, { :class_name => "Event", :foreign_key => "creator_id", :dependent => :destroy })
  has_many(:sent_follow_requests, { :class_name => "EventRequest", :foreign_key => "sender_id", :dependent => :destroy })
  has_many(:received_follow_requests, { :class_name => "EventRequest", :foreign_key => "owner_id", :dependent => :destroy })
  has_many(:my_events, { :class_name => "MyEvent", :foreign_key => "user_id", :dependent => :destroy })
  

  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
end
