class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :dir
      t.string :group
      t.string :title
      t.string :subtitle
      t.string :artist

      t.timestamps
    end
  end
end
