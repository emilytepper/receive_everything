require 'spec_helper'

describe "share_links/new" do
  before(:each) do
    assign(:share_link, stub_model(ShareLink,
      :url => "MyString",
      :clicks => 1,
      :shares => 1,
      :creatrix => nil,
      :description => "MyText",
      :image => "MyString"
    ).as_new_record)
  end

  it "renders new share_link form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", share_links_path, "post" do
      assert_select "input#share_link_url[name=?]", "share_link[url]"
      assert_select "input#share_link_clicks[name=?]", "share_link[clicks]"
      assert_select "input#share_link_shares[name=?]", "share_link[shares]"
      assert_select "input#share_link_creatrix[name=?]", "share_link[creatrix]"
      assert_select "textarea#share_link_description[name=?]", "share_link[description]"
      assert_select "input#share_link_image[name=?]", "share_link[image]"
    end
  end
end
