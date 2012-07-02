class CreateTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.integer :album_id
      t.string :title
      t.integer :duration ,:default=>0
      t.timestamps
    end
    add_index :tracks, [:album_id, :title]
  end
end
