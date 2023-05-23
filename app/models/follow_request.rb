# == Schema Information
#
# Table name: follow_requests
#
#  id           :integer          not null, primary key
#  status       :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer
#
class FollowRequest < ApplicationRecord
  belongs_to(:recipient, { :required => true, :class_name => "User", :foreign_key => "recipient_id", :counter_cache => :received_follow_requests_count })
  belongs_to(:sender, { :required => true, :class_name => "User", :foreign_key => "sender_id", :counter_cache => :sent_follow_requests_count })

  def sender
    my_sender_id = self.sender_id

    matching_senders = User.where({ :id => my_sender_id })
    
    the_sender = matching_senders.at(0)

    return the_sender
  end

end
