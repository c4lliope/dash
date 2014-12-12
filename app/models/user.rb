class User < ActiveRecord::Base
  validates :name, presence: true
  validates :basecamp_name, presence: true
  validates :thoughtbot_email_name, presence: true
end
