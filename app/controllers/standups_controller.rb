class StandupsController < ApplicationController
  def index
    client = BasecampClient.new
    messages = client.standup_messages
    @original_subject = messages["subject"]
    @original_message = messages["content"]
    @orginal_author = messages["creator"]["name"]
    @comments = messages["comments"]

  end
end
