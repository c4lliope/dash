require "json"
require "sentimental"
Sentimental.load_defaults

class BasecampStandupParser
  def initialize(conversation_json)
    @conversation = JSON.parse(conversation_json, symbolize_names: true)
  end

  def status_for(name)
    comment = first_comment_by(name)
    comment[:content]
  rescue
    default_status
  end

  def summary_for(name)
    status_for(name).scan(/\A[^\.]+/).first
  end

  def standups
    authors.reverse.map do |author|
      standup_for(author)
    end
  end

  def standup_for(user)
    {
      name: user,
      summary: summary_for(user),
      sentiment: analyzer.get_sentiment(status_for(user)),
    } rescue default_standup_for(user)
  end

  private

  def default_comment
    { content: "Working at thoughtbot." }
  end

  def analyzer
    @analyzer = Sentimental.new
  end

  def authors
    comments.map {|comment| comment[:creator][:name] }.uniq
  end

  def first_comment_by(name)
    comments.find { |comment| comment[:creator][:name] == name} || default_comment
  end

  def comments
    [original_post] + conversation[:comments]
  end

  def original_post
    {creator: conversation[:creator], content: conversation[:content]}
  end

  attr_reader :conversation
end
