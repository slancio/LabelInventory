class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.integer :user_id, null: false
      t.integer :track_id, null: false
      t.text :note_text, null: false

      t.timestamps
    end
    add_index :notes, [:user_id, :track_id]
  end
end
