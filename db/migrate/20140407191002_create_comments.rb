class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.belongs_to :mystic, index: true
      t.string :subject_type
      t.integer :subject_id
      t.text :text
      t.integer :is_reply_to
      t.boolean :hidden

      t.timestamps
    end
  end
end
