require "rails_helper"

RSpec.describe QuotesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/quotes").to route_to("quotes#index")
    end

    it "routes to #new" do
      expect(:get => "/quotes/new").to route_to("quotes#new")
    end

    it "routes to #show" do
      expect(:get => "/quotes/1").to route_to("quotes#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/quotes/1/edit").to route_to("quotes#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/quotes").to route_to("quotes#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/quotes/1").to route_to("quotes#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/quotes/1").to route_to("quotes#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/quotes/1").to route_to("quotes#destroy", :id => "1")
    end

    it "routes to #random" do
      expect(:get => "/quotes/random").to route_to("quotes#random")
    end

    it "routes root path to #random" do
      expect(:get => "/").to route_to("quotes#random")
    end

    it "routes path to #random" do
      expect(:put => "/quotes/update_cheesy_score/").to route_to(
      "quotes#score_quotes_along_cheesy_scale")
    end
  end
end
