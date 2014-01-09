require 'spec_helper'

describe "accesses/new" do
  before(:each) do
    assign(:access, stub_model(Access,
      :meditation => nil,
      :mystic => nil
    ).as_new_record)
  end

  it "renders new access form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", accesses_path, "post" do
      assert_select "input#access_meditation[name=?]", "access[meditation]"
      assert_select "input#access_mystic[name=?]", "access[mystic]"
    end
  end
end
