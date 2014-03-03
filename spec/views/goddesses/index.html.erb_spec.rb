require 'spec_helper'

describe "goddesses/index" do
  before(:each) do
    assign(:goddesses, [
      stub_model(Goddess,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :personal_statement => "MyText",
        :mystic_id => 1
      ),
      stub_model(Goddess,
        :first_name => "First Name",
        :last_name => "Last Name",
        :email => "Email",
        :personal_statement => "MyText",
        :mystic_id => 1
      )
    ])
  end

  it "renders a list of goddesses" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
