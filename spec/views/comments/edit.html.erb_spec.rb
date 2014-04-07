require 'spec_helper'

describe "comments/edit" do
  before(:each) do
    @comment = assign(:comment, stub_model(Comment,
      :mystic => nil,
      :subject => "",
      :text => "MyText",
      :is_reply_to => 1,
      :hidden => false
    ))
  end

  it "renders the edit comment form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", comment_path(@comment), "post" do
      assert_select "input#comment_mystic[name=?]", "comment[mystic]"
      assert_select "input#comment_subject[name=?]", "comment[subject]"
      assert_select "textarea#comment_text[name=?]", "comment[text]"
      assert_select "input#comment_is_reply_to[name=?]", "comment[is_reply_to]"
      assert_select "input#comment_hidden[name=?]", "comment[hidden]"
    end
  end
end
