require 'spec_helper'

describe "mystics/new" do
  before(:each) do
    assign(:mystic, stub_model(Mystic).as_new_record)
  end

  it "renders new mystic form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", mystics_path, "post" do
    end
  end
end
