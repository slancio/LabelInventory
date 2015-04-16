class AddForeignKeys < ActiveRecord::Migration
  def change
    add_column :albums, :band_id, :integer
    add_column :tracks, :album_id, :integer
  end
end
