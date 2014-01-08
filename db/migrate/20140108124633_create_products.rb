class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.boolean :active
      t.integer :creator_id

      t.timestamps
    end
  end
end
