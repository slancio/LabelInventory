class FixForeignKeys < ActiveRecord::Migration
  def change
    remove_column :albums, :band_id
    remove_column :tracks, :album_id
    add_column :albums, :band_id, :integer, null: false
    add_column :tracks, :album_id, :integer, null: false
  end
end
