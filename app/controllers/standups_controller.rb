require "basecamp_standup_parser"

class StandupsController < ApplicationController
  POTENTIAL_FUNNY_THINGS = [
    "accident",
    "cats",
    "child",
    "dog",
  ]

  POTENTIAL_OTHER_FUNNY_THINGS = [
    "fail",
    "fall",
    "funny",
    "trip",
  ]

  before_filter :find_bad_ass_gif

  def index
    client = BasecampClient.new
    messages = client.standup_messages
    parser = BasecampStandupParser.new(messages.to_json)
    @summaries = parser.summaries
  end

  def find_bad_ass_gif
    query_string = "#{POTENTIAL_FUNNY_THINGS.sample}+#{POTENTIAL_OTHER_FUNNY_THINGS.sample}"
    response = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=#{query_string}&api_key=#{ENV["GIPHY_PUBLIC_KEY"]}")
    random_selection = rand(response["data"].count)
    @embed_url = response["data"][random_selection]["embed_url"]
  end
end
