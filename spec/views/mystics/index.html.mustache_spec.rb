require 'spec_helper'

describe "mystics/index" do
  before(:each) do
    assign(:mystics, [
      stub_model(Mystic),
      stub_model(Mystic)
    ])
  end

  it "renders a list of mystics" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
