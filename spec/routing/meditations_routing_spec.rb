require "spec_helper"

describe MeditationsController do
  describe "routing" do

    it "routes to #index" do
      get("/meditations").should route_to("meditations#index")
    end

    it "routes to #new" do
      get("/meditations/new").should route_to("meditations#new")
    end

    it "routes to #show" do
      get("/meditations/1").should route_to("meditations#show", :id => "1")
    end

    it "routes to #edit" do
      get("/meditations/1/edit").should route_to("meditations#edit", :id => "1")
    end

    it "routes to #create" do
      post("/meditations").should route_to("meditations#create")
    end

    it "routes to #update" do
      put("/meditations/1").should route_to("meditations#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/meditations/1").should route_to("meditations#destroy", :id => "1")
    end

  end
end
