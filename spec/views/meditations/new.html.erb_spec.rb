require 'spec_helper'

describe "meditations/new" do
  before(:each) do
    assign(:meditation, stub_model(Meditation,
      :name => "MyString",
      :soundcloud_url => "MyString",
      :creator_id => 1
    ).as_new_record)
  end

  it "renders new meditation form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", meditations_path, "post" do
      assert_select "input#meditation_name[name=?]", "meditation[name]"
      assert_select "input#meditation_soundcloud_url[name=?]", "meditation[soundcloud_url]"
      assert_select "input#meditation_creator_id[name=?]", "meditation[creator_id]"
    end
  end
end
