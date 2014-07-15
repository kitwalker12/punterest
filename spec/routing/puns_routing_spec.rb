require "rails_helper"

RSpec.describe PunsController, :type => :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/puns").to route_to("puns#index")
    end

    it "routes to #new" do
      expect(:get => "/puns/new").to route_to("puns#new")
    end

    it "routes to #show" do
      expect(:get => "/puns/1").to route_to("puns#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/puns/1/edit").to route_to("puns#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/puns").to route_to("puns#create")
    end

    it "routes to #update" do
      expect(:put => "/puns/1").to route_to("puns#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/puns/1").to route_to("puns#destroy", :id => "1")
    end

  end
end
