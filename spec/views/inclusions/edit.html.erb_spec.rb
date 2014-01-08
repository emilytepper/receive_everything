require 'spec_helper'

describe "inclusions/edit" do
  before(:each) do
    @inclusion = assign(:inclusion, stub_model(Inclusion,
      :product => nil,
      :meditation => nil,
      :creator_id => 1
    ))
  end

  it "renders the edit inclusion form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", inclusion_path(@inclusion), "post" do
      assert_select "input#inclusion_product[name=?]", "inclusion[product]"
      assert_select "input#inclusion_meditation[name=?]", "inclusion[meditation]"
      assert_select "input#inclusion_creator_id[name=?]", "inclusion[creator_id]"
    end
  end
end
