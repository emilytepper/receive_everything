class CreateGoddesses < ActiveRecord::Migration
  def change
    create_table :goddesses do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :personal_statement
      t.integer :mystic_id

      t.timestamps
    end
  end
end
