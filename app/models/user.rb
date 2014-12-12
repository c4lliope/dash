class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :basecamp_name, presence: true, uniqueness: true
  validates :thoughtbot_email_name, presence: true, uniqueness: true

  def save
    self.name ||= basecamp_name.scan(/\w+/).first
    self.thoughtbot_email_name ||= self.name.downcase
    super
  end
end
