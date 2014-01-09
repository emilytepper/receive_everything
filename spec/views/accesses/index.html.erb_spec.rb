require 'spec_helper'

describe "accesses/index" do
  before(:each) do
    assign(:accesses, [
      stub_model(Access,
        :meditation => nil,
        :mystic => nil
      ),
      stub_model(Access,
        :meditation => nil,
        :mystic => nil
      )
    ])
  end

  it "renders a list of accesses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
