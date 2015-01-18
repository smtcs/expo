require "rails_helper"

RSpec.describe WebsitesController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/").to route_to("websites#index")
    end

    it "routes to #new" do
      expect(:get => "/new").to route_to("websites#new")
    end

    it "routes to #show" do
      expect(:get => "/1").to route_to("websites#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/1/edit").to route_to("websites#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/").to route_to("websites#create")
    end

    it "routes to #update" do
      expect(:put => "/1").to route_to("websites#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/1").to route_to("websites#destroy", :id => "1")
    end

  end
end
