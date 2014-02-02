class MeditationsHaveEmbed < ActiveRecord::Migration
  def change
    add_column :meditations, :embed, :text
  end
end
