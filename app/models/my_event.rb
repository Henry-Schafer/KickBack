# == Schema Information
#
# Table name: my_events
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  event_id   :integer
#  user_id    :integer
#
class MyEvent < ApplicationRecord
  belongs_to(:event)
end
