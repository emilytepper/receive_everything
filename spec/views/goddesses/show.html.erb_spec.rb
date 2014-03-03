require 'spec_helper'

describe "goddesses/show" do
  before(:each) do
    @goddess = assign(:goddess, stub_model(Goddess,
      :first_name => "First Name",
      :last_name => "Last Name",
      :email => "Email",
      :personal_statement => "MyText",
      :mystic_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/First Name/)
    rendered.should match(/Last Name/)
    rendered.should match(/Email/)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
  end
end
