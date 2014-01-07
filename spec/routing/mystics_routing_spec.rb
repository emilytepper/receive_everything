require "spec_helper"

describe MysticsController do
  describe "routing" do

    it "routes to #index" do
      get("/mystics").should route_to("mystics#index")
    end

    it "routes to #new" do
      get("/mystics/new").should route_to("mystics#new")
    end

    it "routes to #show" do
      get("/mystics/1").should route_to("mystics#show", :id => "1")
    end

    it "routes to #edit" do
      get("/mystics/1/edit").should route_to("mystics#edit", :id => "1")
    end

    it "routes to #create" do
      post("/mystics").should route_to("mystics#create")
    end

    it "routes to #update" do
      put("/mystics/1").should route_to("mystics#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/mystics/1").should route_to("mystics#destroy", :id => "1")
    end

  end
end
