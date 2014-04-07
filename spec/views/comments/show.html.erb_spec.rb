require 'spec_helper'

describe "comments/show" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :mystic => nil,
      :subject => "",
      :text => "MyText",
      :is_reply_to => 1,
      :hidden => false
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(//)
    rendered.should match(//)
    rendered.should match(/MyText/)
    rendered.should match(/1/)
    rendered.should match(/false/)
  end
end
