# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  name       :string(255)
#

class User < ActiveRecord::Base
  validates :email, uniqueness: true, presence: true, email: true
  scope :emails, -> { pluck(:email).join(',') }
end
