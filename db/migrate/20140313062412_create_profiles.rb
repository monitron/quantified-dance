class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name
      t.datetime :last_played_at
      t.decimal :total_play_seconds

      t.timestamps
    end
  end
end
