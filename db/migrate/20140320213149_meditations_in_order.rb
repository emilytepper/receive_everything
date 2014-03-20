class MeditationsInOrder < ActiveRecord::Migration
  def change
    add_column :inclusions, :position, :integer
  end
end
