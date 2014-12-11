require "Basecamp_standup_parser"

RSpec.describe BasecampStandupParser do
  it "returns a status given a person" do
    json = File.read(fixture_file)
    parser = BasecampStandupParser.new(json)

    status = parser.status_for("Rich Rines")

    expect(status).to eq "Teespring"
  end

  it "returns a short summary for standup" do
    json = File.read(fixture_file)
    parser = BasecampStandupParser.new(json)
    {
      "Steven Harley" => "Another appointment this morning, should be in the office around 10",
      "Rich Rines" => "Teespring",
      "Carlo Iyog" => "- I have an 11 am appointment and will likely miss standup",
      "Michelle Venetucci Harvey" => "At teespring",
      "Grayson Wright" => "WFH this morning on Autodesk, I'll be in this afternoon",
      "Greg Lazarev" => "WFH on Autodesk until lunch",
    }.each do |name, summary|
      status = parser.summary_for(name)

      expect(status).to eq summary
    end
  end

  def fixture_file
    File.expand_path("../fixtures/basecamp_thread.json", __FILE__)
  end
end
