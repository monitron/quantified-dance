class CreatePlays < ActiveRecord::Migration
  def change
    create_table :plays do |t|
      t.string   :guid
      t.integer  :profile_id
      t.integer  :song_id
      t.string   :difficulty
      t.string   :grade
      t.integer  :score
      t.float    :percent_dp
      t.integer  :max_combo
      t.float    :survive_seconds
      t.datetime :played_at

      t.timestamps
    end
  end
end
