# == Schema Information
#
# Table name: messages
#
#  id                   :integer          not null, primary key
#  content              :string
#  owner                :string
#  reaction_manager     :string
#  reaction_user        :string
#  read_receipt_manager :boolean
#  read_receipt_user    :boolean
#  request_type         :boolean
#  subject              :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  agent_id             :integer
#  from_agent_id        :integer
#  user_id              :integer
#
class Message < ApplicationRecord
  belongs_to(:user, { :required => true, :class_name => "User", :foreign_key => "user_id", :counter_cache => true })
  belongs_to(:agent, { :required => true, :class_name => "Agent", :foreign_key => "agent_id", :counter_cache => true })
end
