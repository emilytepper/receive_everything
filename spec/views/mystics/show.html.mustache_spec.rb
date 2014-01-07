require 'spec_helper'

describe "mystics/show" do
  before(:each) do
    @mystic = assign(:mystic, stub_model(Mystic))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
  end
end
