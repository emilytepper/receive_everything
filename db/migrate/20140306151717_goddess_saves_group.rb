class GoddessSavesGroup < ActiveRecord::Migration
  def change
    add_column :goddesses, :group_choice, :string
  end
end
