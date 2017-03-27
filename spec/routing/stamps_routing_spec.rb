require "rails_helper"

RSpec.describe StampsController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/stamps").to route_to("stamps#index")
    end

    it "routes to #new" do
      expect(:get => "/stamps/new").to route_to("stamps#new")
    end

    it "routes to #show" do
      expect(:get => "/stamps/1").to route_to("stamps#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/stamps/1/edit").to route_to("stamps#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/stamps").to route_to("stamps#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/stamps/1").to route_to("stamps#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/stamps/1").to route_to("stamps#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/stamps/1").to route_to("stamps#destroy", :id => "1")
    end

  end
end
