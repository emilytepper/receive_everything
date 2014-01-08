require 'spec_helper'

describe "prices/show" do
  before(:each) do
    @price = assign(:price, stub_model(Price,
      :product => nil,
      :cents => 1,
      :active => false,
      :creator_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(/1/)
    rendered.should match(/false/)
    rendered.should match(/2/)
  end
end
