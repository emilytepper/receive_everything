require 'spec_helper'

describe "products/new" do
  before(:each) do
    assign(:product, stub_model(Product,
      :name => "MyString",
      :active => false,
      :creator_id => 1
    ).as_new_record)
  end

  it "renders new product form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", products_path, "post" do
      assert_select "input#product_name[name=?]", "product[name]"
      assert_select "input#product_active[name=?]", "product[active]"
      assert_select "input#product_creator_id[name=?]", "product[creator_id]"
    end
  end
end
