class MysticHasStripeId < ActiveRecord::Migration
  def change
    add_column :mystics, :stripe_id, :string
  end
end
