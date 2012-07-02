class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.integer :artist_id
      t.string :cover
      t.string :label
      t.text :review
      t.date :release_at

      t.timestamps
    end
    add_index :albums, [:label, :artist_id]
  end
end
