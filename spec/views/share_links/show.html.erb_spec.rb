require 'spec_helper'

describe "share_links/show" do
  before(:each) do
    @share_link = assign(:share_link, stub_model(ShareLink,
      :url => "Url",
      :clicks => 1,
      :shares => 2,
      :creatrix => nil,
      :description => "MyText",
      :image => "Image"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Url/)
    rendered.should match(/1/)
    rendered.should match(/2/)
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(/Image/)
  end
end
