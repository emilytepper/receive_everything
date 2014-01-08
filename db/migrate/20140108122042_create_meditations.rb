class CreateMeditations < ActiveRecord::Migration
  def change
    create_table :meditations do |t|
      t.string :name
      t.string :soundcloud_url
      t.integer :creator_id

      t.timestamps
    end
  end
end
