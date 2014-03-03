require "spec_helper"

describe GoddessesController do
  describe "routing" do

    it "routes to #index" do
      get("/goddesses").should route_to("goddesses#index")
    end

    it "routes to #new" do
      get("/goddesses/new").should route_to("goddesses#new")
    end

    it "routes to #show" do
      get("/goddesses/1").should route_to("goddesses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/goddesses/1/edit").should route_to("goddesses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/goddesses").should route_to("goddesses#create")
    end

    it "routes to #update" do
      put("/goddesses/1").should route_to("goddesses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/goddesses/1").should route_to("goddesses#destroy", :id => "1")
    end

  end
end
