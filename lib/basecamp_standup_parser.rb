require "json"
require "sentimental"
Sentimental.load_defaults

class BasecampStandupParser
  def initialize(conversation_json)
    @conversation = JSON.parse(conversation_json, symbolize_names: true)
  end

  def status_for(name)
    first_comment_by(name)[:content]
  end

  def summary_for(name)
    status_for(name).scan(/\A[^\.]+/).first
  end

  def summaries
    authors.reverse.map do |author|
      {
        name: author,
        summary: summary_for(author),
        sentiment: analyzer.get_sentiment(status_for(author)),
      }
    end
  end

  private

  def analyzer
    @analyzer = Sentimental.new
  end

  def authors
    comments.map {|comment| comment[:creator][:name] }.uniq
  end

  def first_comment_by(name)
    comments.find { |comment| comment[:creator][:name] == name}
  end

  def comments
    [original_post] + conversation[:comments]
  end

  def original_post
    {creator: conversation[:creator], content: conversation[:content]}
  end

  attr_reader :conversation
end
