require 'spec_helper'

describe "goddesses/edit" do
  before(:each) do
    @goddess = assign(:goddess, stub_model(Goddess,
      :first_name => "MyString",
      :last_name => "MyString",
      :email => "MyString",
      :personal_statement => "MyText",
      :mystic_id => 1
    ))
  end

  it "renders the edit goddess form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", goddess_path(@goddess), "post" do
      assert_select "input#goddess_first_name[name=?]", "goddess[first_name]"
      assert_select "input#goddess_last_name[name=?]", "goddess[last_name]"
      assert_select "input#goddess_email[name=?]", "goddess[email]"
      assert_select "textarea#goddess_personal_statement[name=?]", "goddess[personal_statement]"
      assert_select "input#goddess_mystic_id[name=?]", "goddess[mystic_id]"
    end
  end
end
