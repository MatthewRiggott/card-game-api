require 'rails_helper'

RSpec.describe "routes for Games", :type => :routing do
  it "routes /games to the games controller" do
    expect(get("/games")).to route_to("games#index")
  end

  it "routes post /games to games create" do
    expect(post("/games")).to route_to("games#create")
  end
end