require 'spec_helper'

describe "inclusions/show" do
  before(:each) do
    @inclusion = assign(:inclusion, stub_model(Inclusion,
      :product => nil,
      :meditation => nil,
      :creator_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/1/)
  end
end
