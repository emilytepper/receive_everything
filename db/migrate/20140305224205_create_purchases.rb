class CreatePurchases < ActiveRecord::Migration
  def change
    create_table :purchases do |t|
      t.belongs_to :product, index: true
      t.belongs_to :mystic, index: true
      t.belongs_to :price, index: true

      t.timestamps
    end
  end
end
