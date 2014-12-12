require "basecamp_standup_parser"
require "bart"

class StandupsController < ApplicationController
  before_filter :find_bad_ass_gif

  def index
    client = BasecampClient.new
    messages = client.standup_messages
    parser = BasecampStandupParser.new(messages.to_json)
    @summaries = parser.standups
    @summaries.each do |summary|
      summary[:image] = gravatar_image_for(summary[:name])
    end
    @bart_departures = Bart.new.next_departing_trains(5)
  end

  def find_bad_ass_gif
    response = HTTParty.get("http://api.giphy.com/v1/gifs/trending?api_key=#{ENV["GIPHY_PUBLIC_KEY"]}")
    random_selection = rand(response["data"].count)
    @embed_url = response["data"][random_selection]["embed_url"]
  end

  def gravatar_image_for(name)
    user = User.find_by(name: name)
    Gravatar.new(user.thoughtbot_email).to_s
  end
end
