class BasecampClient
  def initialize
    basecamp_ID = ENV["BASECAMP_ID"]
    auth_hash = { :username => ENV["BASECAMP_USER"], :password =>  ENV["BASECAMP_PASSWORD"] }
    user_agent = "LoganUserAgent (ralph@thoughtbot.com)"
    @client = Logan::Client.new(basecamp_ID, auth_hash, user_agent)
  end

  def standup_messages
    projects = @client.projects
    projects.first.most_recent_standup_messages
  end
end
