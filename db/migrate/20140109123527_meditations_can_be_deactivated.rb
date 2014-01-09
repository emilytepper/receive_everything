class MeditationsCanBeDeactivated < ActiveRecord::Migration
  def change
    add_column :meditations, :active, :boolean
  end
end
