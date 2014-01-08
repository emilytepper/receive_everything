require 'spec_helper'

describe "meditations/show" do
  before(:each) do
    @meditation = assign(:meditation, stub_model(Meditation,
      :name => "Name",
      :soundcloud_url => "Soundcloud Url",
      :creator_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Soundcloud Url/)
    rendered.should match(/1/)
  end
end
