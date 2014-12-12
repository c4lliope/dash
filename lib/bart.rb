require "nokogiri"
require "httparty"

class Bart
  def initialize(key = "MW9S-E7SL-26DU-VV8V")
    @key = key
  end

  def next_departing_trains(limit = 5)
    response = HTTParty.get(url).body
    doc = Nokogiri::XML(response)

    departures = doc.css("etd").map do |etd|
      destination = etd.css("destination").text
      etd.css("estimate").map do |estimate|
        minutes = estimate.css("minutes").text
        Departure.new(destination, minutes)
      end
    end.flatten

    departures.sort! do |a, b|
      a.minutes_until_departure.to_i <=> b.minutes_until_departure.to_i
    end

    departures[0...limit]
  end

  class Departure
    def initialize(destination, minutes_until_departure)
      @destination = destination
      @minutes_until_departure = minutes_until_departure.to_i
    end

    attr_reader :destination, :minutes_until_departure
  end

  protected

  def url
    "http://api.bart.gov/api/etd.aspx?cmd=etd&orig=#{station_key}&key=#{key}"
  end

  def station_key
    "mont"
  end

  attr_reader :key
end
