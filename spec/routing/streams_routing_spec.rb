require 'rails_helper'

RSpec.describe "routes for EventSource streams", :type => :routing do
  it "routes /streams_lobby to the streams controller" do
    expect(get("/streams_lobby")).to route_to("streams#lobby")
  end
end