class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.belongs_to :product, index: true
      t.integer :cents
      t.datetime :start_time
      t.datetime :end_time
      t.boolean :active
      t.integer :creator_id

      t.timestamps
    end
  end
end
