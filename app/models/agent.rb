# == Schema Information
#
# Table name: agents
#
#  id                :integer          not null, primary key
#  about             :string
#  email             :string
#  first_name        :string
#  gigs_count        :integer
#  last_name         :string
#  linkedin_url      :string
#  messages_count    :integer
#  organization_name :string
#  password_digest   :string
#  photo             :string
#  timezone          :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Agent < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:messages, { :class_name => "Message", :foreign_key => "agent_id", :dependent => :destroy })
  has_many(:gigs, { :class_name => "Gig", :foreign_key => "agent_id", :dependent => :destroy })
  mount_uploader :photo, PhotoUploader
end
