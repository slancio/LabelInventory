class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :name, null: false
      t.string :standard_or_bonus, null: false
      t.text :lyrics

      t.timestamps
    end

    add_index :tracks, :name
  end
end
