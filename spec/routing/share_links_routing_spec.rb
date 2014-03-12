require "spec_helper"

describe ShareLinksController do
  describe "routing" do

    it "routes to #index" do
      get("/share_links").should route_to("share_links#index")
    end

    it "routes to #new" do
      get("/share_links/new").should route_to("share_links#new")
    end

    it "routes to #show" do
      get("/share_links/1").should route_to("share_links#show", :id => "1")
    end

    it "routes to #edit" do
      get("/share_links/1/edit").should route_to("share_links#edit", :id => "1")
    end

    it "routes to #create" do
      post("/share_links").should route_to("share_links#create")
    end

    it "routes to #update" do
      put("/share_links/1").should route_to("share_links#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/share_links/1").should route_to("share_links#destroy", :id => "1")
    end

  end
end
