class CreateCharts < ActiveRecord::Migration
  def change
    create_table :charts do |t|
      t.integer :song_id
      t.string :steps_type
      t.string :difficulty
      t.integer :meter

      t.timestamps
    end
  end
end
