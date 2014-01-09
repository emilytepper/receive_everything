require 'spec_helper'

describe "accesses/edit" do
  before(:each) do
    @access = assign(:access, stub_model(Access,
      :meditation => nil,
      :mystic => nil
    ))
  end

  it "renders the edit access form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", access_path(@access), "post" do
      assert_select "input#access_meditation[name=?]", "access[meditation]"
      assert_select "input#access_mystic[name=?]", "access[mystic]"
    end
  end
end
