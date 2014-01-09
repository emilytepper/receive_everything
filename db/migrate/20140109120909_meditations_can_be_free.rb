class MeditationsCanBeFree < ActiveRecord::Migration
  def change
    add_column :meditations, :free, :boolean
  end
end
