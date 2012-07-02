class CreateArtists < ActiveRecord::Migration
  def change
    create_table :artists do |t|
      t.integer :user_id
      t.string :name
      t.text :biography

      t.timestamps
    end
    add_index :artists, [:name, :user_id]

  end
end
