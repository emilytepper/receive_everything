require 'spec_helper'

describe "share_links/index" do
  before(:each) do
    assign(:share_links, [
      stub_model(ShareLink,
        :url => "Url",
        :clicks => 1,
        :shares => 2,
        :creatrix => nil,
        :description => "MyText",
        :image => "Image"
      ),
      stub_model(ShareLink,
        :url => "Url",
        :clicks => 1,
        :shares => 2,
        :creatrix => nil,
        :description => "MyText",
        :image => "Image"
      )
    ])
  end

  it "renders a list of share_links" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Image".to_s, :count => 2
  end
end
