class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :guid
      t.date :last_played_on
      t.integer :total_play_seconds

      t.timestamps
    end
  end
end
