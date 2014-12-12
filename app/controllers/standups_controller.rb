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
    @original_subject = messages["subject"]
    @original_message = messages["content"]
    @orginal_author = messages["creator"]["name"]
    @comments = messages["comments"]

  end

  def find_bad_ass_gif
    query_string = "#{POTENTIAL_FUNNY_THINGS.sample}+#{POTENTIAL_OTHER_FUNNY_THINGS.sample}"
    response = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=#{query_string}&api_key=#{ENV["GIPHY_PUBLIC_KEY"]}")
    random_selection = rand(response["data"].count)
    @gif = response["data"][random_selection]["images"]["fixed_height"]["url"]
  end
end
