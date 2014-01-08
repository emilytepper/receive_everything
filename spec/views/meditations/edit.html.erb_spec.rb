require 'spec_helper'

describe "meditations/edit" do
  before(:each) do
    @meditation = assign(:meditation, stub_model(Meditation,
      :name => "MyString",
      :soundcloud_url => "MyString",
      :creator_id => 1
    ))
  end

  it "renders the edit meditation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", meditation_path(@meditation), "post" do
      assert_select "input#meditation_name[name=?]", "meditation[name]"
      assert_select "input#meditation_soundcloud_url[name=?]", "meditation[soundcloud_url]"
      assert_select "input#meditation_creator_id[name=?]", "meditation[creator_id]"
    end
  end
end
