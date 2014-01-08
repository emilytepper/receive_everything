require 'spec_helper'

describe "prices/new" do
  before(:each) do
    assign(:price, stub_model(Price,
      :product => nil,
      :cents => 1,
      :active => false,
      :creator_id => 1
    ).as_new_record)
  end

  it "renders new price form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", prices_path, "post" do
      assert_select "input#price_product[name=?]", "price[product]"
      assert_select "input#price_cents[name=?]", "price[cents]"
      assert_select "input#price_active[name=?]", "price[active]"
      assert_select "input#price_creator_id[name=?]", "price[creator_id]"
    end
  end
end
