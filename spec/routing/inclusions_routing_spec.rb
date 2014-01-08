require "spec_helper"

describe InclusionsController do
  describe "routing" do

    it "routes to #index" do
      get("/inclusions").should route_to("inclusions#index")
    end

    it "routes to #new" do
      get("/inclusions/new").should route_to("inclusions#new")
    end

    it "routes to #show" do
      get("/inclusions/1").should route_to("inclusions#show", :id => "1")
    end

    it "routes to #edit" do
      get("/inclusions/1/edit").should route_to("inclusions#edit", :id => "1")
    end

    it "routes to #create" do
      post("/inclusions").should route_to("inclusions#create")
    end

    it "routes to #update" do
      put("/inclusions/1").should route_to("inclusions#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/inclusions/1").should route_to("inclusions#destroy", :id => "1")
    end

  end
end
