# == Schema Information
#
# Table name: gigs
#
#  id          :integer          not null, primary key
#  description :string
#  industry    :string
#  title       :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  agent_id    :integer
#  user_id     :integer
#
class Gig < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id" })
  belongs_to(:agent, { :class_name => "Agent", :foreign_key => "agent_id", :counter_cache => true })
end
