require "lib/basecamp_standup_parser"

class StandupsController < ApplicationController
  def index
    client = BasecampClient.new
    messages = client.standup_messages
    parser = BasecampStandupParser.new(messages.to_json)
    @summaries = parser.summaries
  end
end
