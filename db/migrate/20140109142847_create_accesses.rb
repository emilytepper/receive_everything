class CreateAccesses < ActiveRecord::Migration
  def change
    create_table :accesses do |t|
      t.belongs_to :meditation, index: true
      t.belongs_to :mystic, index: true

      t.timestamps
    end
  end
end
