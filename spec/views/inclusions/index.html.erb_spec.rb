require 'spec_helper'

describe "inclusions/index" do
  before(:each) do
    assign(:inclusions, [
      stub_model(Inclusion,
        :product => nil,
        :meditation => nil,
        :creator_id => 1
      ),
      stub_model(Inclusion,
        :product => nil,
        :meditation => nil,
        :creator_id => 1
      )
    ])
  end

  it "renders a list of inclusions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
