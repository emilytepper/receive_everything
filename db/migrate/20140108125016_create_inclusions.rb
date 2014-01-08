class CreateInclusions < ActiveRecord::Migration
  def change
    create_table :inclusions do |t|
      t.belongs_to :product, index: true
      t.belongs_to :meditation, index: true
      t.integer :creator_id

      t.timestamps
    end
  end
end
