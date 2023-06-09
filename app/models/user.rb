# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  about           :string
#  email           :string
#  first_name      :string
#  last_name       :string
#  messages_count  :integer
#  password_digest :string
#  photo           :string
#  timezone        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  validates :email, :uniqueness => { :case_sensitive => false }
  validates :email, :presence => true
  has_secure_password
  has_many(:gigs, { :class_name => "Gig", :foreign_key => "user_id", :dependent => :destroy })
  has_many(:messages, { :class_name => "Message", :foreign_key => "user_id", :dependent => :destroy })
  mount_uploader :photo, PhotoUploader
end
