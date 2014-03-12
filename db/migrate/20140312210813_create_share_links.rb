class CreateShareLinks < ActiveRecord::Migration
  def change
    create_table :share_links do |t|
      t.string :url
      t.integer :clicks
      t.integer :shares
      t.belongs_to :creatrix, index: true
      t.text :description
      t.string :image

      t.timestamps
    end
  end
end
