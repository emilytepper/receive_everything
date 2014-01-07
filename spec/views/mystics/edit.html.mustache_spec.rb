require 'spec_helper'

describe "mystics/edit" do
  before(:each) do
    @mystic = assign(:mystic, stub_model(Mystic))
  end

  it "renders the edit mystic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mystic_path(@mystic), "post" do
    end
  end
end
