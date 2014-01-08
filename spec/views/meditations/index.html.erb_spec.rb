require 'spec_helper'

describe "meditations/index" do
  before(:each) do
    assign(:meditations, [
      stub_model(Meditation,
        :name => "Name",
        :soundcloud_url => "Soundcloud Url",
        :creator_id => 1
      ),
      stub_model(Meditation,
        :name => "Name",
        :soundcloud_url => "Soundcloud Url",
        :creator_id => 1
      )
    ])
  end

  it "renders a list of meditations" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Soundcloud Url".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
